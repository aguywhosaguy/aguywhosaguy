{ config, lib, pkgs, ... }:

let
  cfg = config.services.cageKiosk;
in {
  options.services.cageKiosk = {
    enable = lib.mkEnableOption "cage kiosk compositor";

    tty = lib.mkOption {
      type = lib.types.int;
      default = 1;
      description = "Virtual terminal to run cage on";
      example = 2;
    };

    command = lib.mkOption {
      type = lib.types.str;
      description = "Command to run fullscreen in cage";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.cage = {
      isNormalUser = true;
      group = "cage";
      description = "Cage kiosk user";
      home = "/home/cage";
      createHome = true;
      linger = true;
      extraGroups = [ "video" "input" "seat" "render" ];
    };

    users.groups.cage = {};

    systemd.services."cage-tty${toString cfg.tty}" = {
      description = "Cage kiosk compositor on tty${toString cfg.tty}";
      after = [ 
        "systemd-user-sessions.service" 
        "plymouth-quit-wait.service" 
        "sddm.service"
      ];
      wantedBy = [ "graphical.target" ];
      conflicts = [ "getty@tty${toString cfg.tty}.service" ];
      serviceConfig = {
        User = "cage";
        Environment = [
          "XDG_RUNTIME_DIR=/run/user/1001"
          "XDG_DATA_DIRS=/run/current-system/sw/share:/nix/var/nix/profiles/default/share"
          "XDG_SESSION_TYPE=wayland"
          "XDG_CURRENT_DESKTOP=cage"
          "FONTCONFIG_PATH=/etc/fonts"
          "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1001/bus"
          "GDK_PIXBUF_MODULE_FILE=${pkgs.librsvg}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
        ];
        PAMName = "cage-tty${toString cfg.tty}";
        RuntimeDirectory = "cage";
        TTYPath = "/dev/tty${toString cfg.tty}";
        TTYReset = "yes";
        TTYVHangup = "yes";
        TTYVTDisallocate = "yes";
        StandardInput = "tty-fail";
        StandardOutput = "journal";
        StandardError = "journal";
        UtmpIdentifier = "tty${toString cfg.tty}";
        UtmpMode = "user";
        ExecStart = "${pkgs.cage}/bin/cage -d -- ${cfg.command}";
      };
    };

    security.pam.services."cage-tty${toString cfg.tty}".startSession = true;

    environment.systemPackages = [ pkgs.cage ];
  };
}
