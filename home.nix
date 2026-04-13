{ config, pkgs, ...}:

{
  home.username = "henryw";
  home.homeDirectory = "/home/henryw";

  home.packages = with pkgs; [
    
    fastfetch
    
    zip
    xz

    unzip
    p7zip

    google-chrome
    firefox

    ghostty

    vicinae
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix";
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
	"$mod, P, exec, vicinae toggle"
        "$mod, Escape, exec, killactive"
      ];

      layerrule = [
        "blur on, ignore_alpha 0, match:namespace vicinae"
      ];

      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
      ];
    };
  };

  programs.kitty = {
    enable = true;
  };

  home.stateVersion = "25.11";
}
