{ pkgs, config, inputs, ...}:

{

  imports = [
    inputs.noctalia.homeModules.default
    ./shell
    ./desktop
  ];

  home.username = "henryw";
  home.homeDirectory = "/home/henryw";

  home.packages = with pkgs; [
    
    fastfetch
    wev

    eza
    
    zip
    xz
    unzip
    p7zip

    google-chrome
    firefox

    ghostty
    vicinae
    quickshell

    brightnessctl
    bluez
    bluez-tools
  ];

  home.stateVersion = "25.11";
}
