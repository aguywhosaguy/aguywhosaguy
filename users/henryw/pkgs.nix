{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.packages = with pkgs; [
    
    # etc CLI tools
    fastfetch
    wev


    # core CLI tools
    eza # ls alternative
    

    # compression CLI tools
    zip
    xz
    unzip
    p7zip


    # devtools
    bun
    pnpm

    #    (inputs.fenix.packages.${pkgs.system}.stable.withComponents [
    #  "cargo"
    #  "rustc"
    #  "rust-src"
    #  "rustfmt"
    #  "clippy"
    #])
    #inputs.fenix.packages.${pkgs.system}.stable.rust-analyzer


    # desktop programs
    google-chrome
    firefox

    spotify
    vesktop # discord client

    cheese # camera
    kdePackages.gwenview # photo viewer
    vlc # video viewer
    nemo-with-extensions # file explorer

    steam
    
    (writeShellScriptBin "davinci-resolve" ''
      QT_QPA_PLATFORM=xcb exec ${pkgs.davinci-resolve}/bin/davinci-resolve "$@" 
    '')
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-vaapi #optional AMD hardware acceleration
        obs-gstreamer
        obs-vkcapture
      ];
    })

    ghostty # terminal


    # desktop
    vicinae # launcher
    quickshell # dependency for noctalia

    
    # core
    brightnessctl
    bluez
    bluez-tools
    pulseaudio
    wineWow64Packages.stable
    grim
  ];

  services.flatpak.packages = [
    "org.vinegarhq.Sober"
  ];
}
