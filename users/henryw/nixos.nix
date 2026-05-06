{ config, pkgs, inputs, ...}:

{
  imports = 
  [
    inputs.silentSDDM.nixosModules.default
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  networking.firewall.allowedTCPPorts = [ 5173 ];

  hardware.bluetooth.enable = true;

  services.upower.enable = true;

  services.flatpak.enable = true;

  users.users.henryw = {
    isNormalUser = true;
    description = "Henry";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

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

  fonts.packages = with pkgs; [
    open-sans
    nerd-fonts.noto
  ];

  environment.shells = with pkgs; [ zsh ];
}
