{ pkgs, config, inputs, ...}:

{

  imports = [
    inputs.noctalia.homeModules.default
    ./shell # config for cli tools
    ./desktop # config for desktop environment / hyprland

    ./pkgs.nix # nixpkgs, flatpak
  ];

  home.username = "henryw";
  home.homeDirectory = "/home/henryw";

  home.stateVersion = "25.11";
}
