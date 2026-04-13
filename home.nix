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

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  
    settings = {
      "$mod" = "SUPER";
      exec-once = [
        "vicinae server"
      ];

      bind = 
      [
        "$mod, T, exec, ghostty"
	"$mod, P, exec, vicinae toggle"
      ];

      layerrule = [
        "blur on, ignore_alpha 0, match:namespace vicinae"
      ];
    };
  };

  programs.kitty = {
    enable = true;
  };

  home.stateVersion = "25.11";
}
