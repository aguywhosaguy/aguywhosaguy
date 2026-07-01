# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.plymouth = {
    enable = true;
    theme = "breeze";
    themePackages = [ pkgs.kdePackages.breeze-plymouth ];
  };

  boot.kernelParams = [ "quiet" "splash" ];

  boot.blacklistedKernelModules = [ "tpm_tis" "tpm_crb" "tpm" ];
  
  boot.consoleLogLevel = 0;

  boot.loader.timeout = 0;
  
  boot.initrd.verbose = false;

  networking.hostName = "deli";

  networking.firewall.allowedTCPPorts = [ 22 ];

  users.users."nick" = {
    isNormalUser = true;
    description = "Nicholas Wheeler";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
  };

  services.desktopManager.plasma6.enable = true;

  services.displayManager.plasma-login-manager.enable = true;

  services.displayManager.autoLogin = {
    enable = true;
    user = "nick";
  };

  services.openssh.enable = true;

  systemd.suppressedSystemUnits = [
    "dev-tpm0.device"
    "dev-tpmrm0.device"
  ];

  systemd.units."dev-tpm0.device".enable = false;

  systemd.units."dev-tpmrm0.device".enable = false;

  nixpkgs.config.allowUnfree = true;
}
