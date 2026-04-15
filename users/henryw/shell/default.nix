{ pkgs, config, inputs, ... }:

{
  imports = [
    ./zsh.nix
    ./omz.nix
    ./git.nix
  ];
}
