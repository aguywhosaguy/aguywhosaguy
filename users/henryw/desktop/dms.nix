{ pkgs, lib, config, inputs, ...}:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;
  
  programs.dank-material-shell = {
    enable = true;

    niri = {
      enableSpawn = true;
      enableKeybinds = true;
      includes.enable = false;
    };

    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
  };
}
