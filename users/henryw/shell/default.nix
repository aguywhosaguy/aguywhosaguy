{ pkgs, config, inputs, ... }:

{
  imports = [
    ./zsh.nix
    ./omz.nix
    ./git.nix
    ./nvim.nix
    ./helix.nix
    ./starship.nix
  ];
}
