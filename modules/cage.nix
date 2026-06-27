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
      extraGroups = [ "video" "input" "seat" ];
    };

    users.groups.cage = {};

    systemd.services."cage-tty${toString cfg.tty}" = {
      description = "Cage kiosk compositor on tty${toString cfg.tty}";
      after = [ "systemd-user-sessions.service" "plymouth-quit-wait.service" ];
      wantedBy = [ "graphical.target" ];
      conflicts = [ "getty@tty${toString cfg.tty}.service" ];
      serviceConfig = {
        User = "cage";
        Environment = "XDG_RUNTIME_DIR=/run/user/1001";
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
        Restart = "always";
        RestartSec = "1s";
        ExecStart = "${pkgs.cage}/bin/cage -d -- ${cfg.command}";
      };
    };

    security.pam.services."cage-tty${toString cfg.tty}".startSession = true;

    environment.systemPackages = [ pkgs.cage ];
  };
}
