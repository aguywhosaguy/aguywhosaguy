{ config, pkgs, ...}:

{
  home.username = "henryw";
  home.homeDiretory = "/home/ryan";

  home.packages = with pkgs; [
    
    neofetch
    
    zip
    xz

    unzip
    p7zip


  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
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

  home.stateVersion = "25.11";
}
