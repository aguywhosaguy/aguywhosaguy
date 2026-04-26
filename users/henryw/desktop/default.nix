{ pkgs, config, inputs, ...}:

{
  imports = [
    ./hyprland.nix
    ./flameshot.nix
    ./noctalia.nix
  ];
}
