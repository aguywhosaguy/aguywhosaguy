{ pkgs, config, inputs, ...}:

{
  imports = [
    ./hyprland.nix
    ./noctalia.nix
  ];
}
