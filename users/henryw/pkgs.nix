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
    helix
    openssh
    file
    steam-run


    # compression CLI tools
    zip
    xz
    unzip
    p7zip


    # devtools
    bun
    pnpm

    (inputs.fenix.packages.${pkgs.system}.stable.withComponents [
      "cargo"
      "rustc"
      "rust-src"
      "rustfmt"
      "clippy"
    ])
    inputs.fenix.packages.${pkgs.system}.stable.rust-analyzer

    gcc
    binutils
    gnumake

    python3

    ghidra-bin

    # desktop programs
    google-chrome
    firefox
    inputs.helium.packages.${system}.default

    spotify
    vesktop # discord client

    zed-editor

    cheese # camera
    kdePackages.gwenview # photo viewer
    vlc # video viewer
    nemo-with-extensions # file explorer

    steam
    heroic

    overskride # bluetooth
    
    anki

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
