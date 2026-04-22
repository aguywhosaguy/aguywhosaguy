{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
    ];

  networking.hostName = "nimonix";

  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware = {
    bluetooth.enable = true;

    graphics.enable = true;
    
    amdgpu.opencl.enable = true;
  };

  services.upower.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
