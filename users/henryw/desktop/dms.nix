{ pkgs, lib, config, inputs, ...}:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
    inputs.dms-plugin-registry.nixosModules.default
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


    settings = {
      blurEnabled = true;

      currentThemeName = "dynamic";
      currentThemeCategory = "dynamic";

      showLauncherButton = false;

      useAutoLocation = true;

      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferences = [
            "all"
          ];
          showOnLastDisplay = true;
          leftWidgets = [
            "workspaceSwitcher"
            "focusedWindow"
          ];
          centerWidgets = [
            "music"
            "clock"
            "weather"
          ];
          rightWidgets = [
            "systemTray"
            "clipboard"
            "cpuUsage"
            "memUsage"
            "notificationButton"
            "battery"
            "controlCenterButton"
          ];
          spacing = 4;
          innerPadding = 4;
          bottomGap = 0;
          transparency = 0;
          widgetTransparency = 1;
          squareCorners = false;
          noBackground = false;
          gothCornersEnabled = false;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = false;
          borderColor = "surfaceText";
          borderOpacity = 1;
          borderThickness = 1;
          fontScale = 1;
          autoHide = false;
          autoHideDelay = 250;
          openOnOverview = false;
          visible = true;
          popupGapsAuto = true;
          popupGapsManual = 4;
        }
      ];
    };
    
    plugins = {
      linuxWallpaperEngine = {
        enable = false;
        settings = {
          monitorScenes = {
            "*" = "2852314079";
          };
        };
      };
    };
  };
}
