{ pkgs, config, inputs, ...}:

{

  imports = [
    inputs.noctalia.homeModules.default
    ./shell
    ./desktop
    ./nvim
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
    
    (writeShellScriptBin "davinci-resolve" ''
      QT_QPA_PLATFORM=xcb exec ${pkgs.davinci-resolve}/bin/davinci-resolve "$@" 
    '')

    ghostty
    vicinae
    quickshell

    brightnessctl
    bluez
    bluez-tools
  ];

  home.stateVersion = "25.11";
}
