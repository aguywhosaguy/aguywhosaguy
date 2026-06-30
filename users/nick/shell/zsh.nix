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
      fupdate = "git add . && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#deli";
      update = "sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#deli";
      cupdate = "git commit -a && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#deli";
      tree = "eza --tree --group-directories-first --git-ignore";
    };
    
  };
}
