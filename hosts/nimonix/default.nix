{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
    ];

  networking.hostName = "nimonix";

  hardware.bluetooth.enable = true;

  services.upower.enable = true;
}
