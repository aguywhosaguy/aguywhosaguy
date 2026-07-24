{ pkgs, config, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
     export PATH="$HOME/.cargo/bin:$PATH"
    '';

    shellAliases = {
      fupdate = "git add . && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix --accept-flake-config";
      update = "sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix --accept-flake-config";
      cupdate = "git commit -a && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix --accept-flake-config";
      tree = "eza --tree --group-directories-first";
    };
    
  };
}
