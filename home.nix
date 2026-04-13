{ config, pkgs, ...}:

{
  home.username = "henryw";
  home.homeDirectory = "/home/henryw";

  home.packages = with pkgs; [
    
    fastfetch
    wev
    
    zip
    xz

    unzip
    p7zip

    google-chrome
    firefox

    ghostty

    vicinae
    brightnessctl
    bluez
    bluez-tools
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      fupdate = "git add . && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix";
      update = "sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix";
      cupdate = "git commit -a && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix";
    };
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "robbyrussell";
    };
  };

  programs.hyprpanel = {
    enable = true;

    settings = {

      layout = {
        bar.layouts = {
          "0" = {
            left = [ "dashboard" "workspaces" ];
            middle = [ "media" ];
            right = [ "volume" "systray" "notifications" ];
          };
        };
      };

      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;

      menus.clock = {
        time = {
          military = false;
          hideSeconds = true;
        };
        weather.unit = "imperial";
      };

      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;

      theme.bar.transparent = true;

      theme.font = {
        name = "CaskaydiaCove NF";
        size = "16px";
      };
    };
  };
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  
    settings = {
      exec-once = [
        "vicinae server"
	"hyprpanel"
      ];

      "$mod" = "SUPER";
      bind = 
      [
        "$mod, T, exec, ghostty"
        "$mod, Escape, exec, killactive"

        ", XF86MonBrightnessUp, exec, brightnessctl s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindr =
      [
        "$mod, SUPER_L, exec, vicinae toggle"
      ];

      layerrule = [
        "blur on, ignore_alpha 0, match:namespace vicinae"
      ];
      
      windowrule = [
        "match:initial_title Ghostty, opacity 0.75"
      ];
      
      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 0.83"
      ];
    };
  };

  programs.kitty = {
    enable = true;
  };

  home.stateVersion = "25.11";
}
