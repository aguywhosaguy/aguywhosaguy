{ pkgs, config, inputs, ...}:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];
}
