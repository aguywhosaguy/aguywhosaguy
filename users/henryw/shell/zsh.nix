{ pkgs, config, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      fupdate = "git add . && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix";
      update = "sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix";
      cupdate = "git commit -a && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix";
      tree = "eza --tree --group-directories-first";
    };
    
  };
}
