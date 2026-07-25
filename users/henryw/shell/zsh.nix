{ pkgs, config, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(starship init zsh)"
      export PATH="$HOME/.cargo/bin:$PATH"
    '';

    shellAliases = {
      fupdate = "cd /home/henryw/projects/aguywhosaguy && git add . && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix --accept-flake-config";
      update = "cd /home/henryw/projects/aguywhosaguy && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix --accept-flake-config";
      cupdate = "cd /home/henryw/projects/aguywhosaguy && git commit -a && sudo nixos-rebuild switch --flake ~/projects/aguywhosaguy#nimonix --accept-flake-config";
      tree = "eza --tree --group-directories-first";
      p = "cd /home/henryw/projects/aguywhosaguy";
      h = "hx .";
    };
    
  };
}
