{ pkgs, config, inputs, ... }:

{
  home.file.".config/autostart/tauri.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Dashboard
    Exec=/home/nick/.nix-profile/bin/dashboard   
    Terminal=false
  '';
}
