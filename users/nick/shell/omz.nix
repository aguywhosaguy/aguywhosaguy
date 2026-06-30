{ pkgs, config, inputs, ... }:

{
  programs.zsh.oh-my-zsh = {
    enable = true;
      plugins = [
        "git"
      ];
    theme = "robbyrussell";
  };
}
