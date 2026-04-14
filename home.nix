{ pkgs, config, inputs, ...}:

{

  imports = [
    inputs.noctalia.homeModules.default
  ];

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
    quickshell
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
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  
    settings = {
      exec-once = [
        "vicinae server"
	"noctalia-shell"
      ];

      "$mod" = "SUPER";
      bind = 
      [
        "$mod, T, exec, ghostty"
        "$mod, Escape, exec, forcekillactive"

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

  programs.noctalia-shell = {
    enable = true;
      settings = {
        # configure noctalia here
        bar = {
          density = "compact";
          position = "right";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ]; 
            right = [
              {
                alwaysShowPercentage = false;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };

        colorSchemes.predefinedScheme = "Monochrome";
        general = {
          radiusRatio = 0.2;
        };
        location = {
          monthBeforeDay = true;
          name = "St. Louis, Missouri";
        };
      };
      # this may also be a string or a path to a JSON file.
  };

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "~/projects/aguywhosaguy/assets/wallpapers/rusty1.jpg";
    };
  };

  programs.kitty = {
    enable = true;
  };

  home.stateVersion = "25.11";
}
