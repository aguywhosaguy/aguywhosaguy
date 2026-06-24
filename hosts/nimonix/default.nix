{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
      inputs.silentSDDM.nixosModules.default
    ];

  users.users.henryw = {
    isNormalUser = true;
    description = "Henry";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "kvm" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  networking.firewall.allowedTCPPorts = [ 5173 ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nimonix";

  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
    
    amdgpu.opencl.enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput = {
    enable = true;
    touchpad = {
      disableWhileTyping = false;
    };
    mouse = {
      disableWhileTyping = false;
    };
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.upower.enable = true;

  services.logind.powerKey = "ignore";

  services.flatpak.enable = true;


  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.gpu-screen-recorder.enable = true;

  programs.silentSDDM = {
    enable = true;
    theme = "default";
  };

  programs.zsh = {
    enable = true;
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";

    QT_QPA_PLATFORM = "wayland";

    GDK_BACKEND = "wayland, x11";

    NIXOS_OZONE_WL = "1";
  };

  environment.shells = with pkgs; [ zsh ];

  fonts.packages = with pkgs; [
    open-sans
    nerd-fonts.noto
  ];
}
