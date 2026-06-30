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

  networking.hostName = "deli";

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

  nixpkgs.config.allowUnfree = true;
}
