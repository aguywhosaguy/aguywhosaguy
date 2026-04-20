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

    bun

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

  home.pointerCursor = {
    gtk.enable = true;
    name = "Nordzy-hyprcursors";
    size = 24;

    package = pkgs.nordzy-cursor-theme;

    hyprcursor = {
      enable = true;
      size = 24;
    };
  };

  #  home.file.".icons/Nordzy-hyprcursors" = {
  # source = pkgs.fetchzip {
  #   url = "https://github.com/guillaumeboehm/Nordzy-cursors/releases/download/v2.4.0/Nordzy-hyprcursors.tar.gz";
  #   hash = "sha256-4RCcwjjEVkkzXNxxy6rooiCfKCNrZ4gig7xQwwlJGWc=";
  # };
  # };

  home.stateVersion = "25.11";
}
