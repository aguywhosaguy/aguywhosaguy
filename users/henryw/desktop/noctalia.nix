{ pkgs, config, inputs, ...}:

{
  programs.noctalia-shell = {
    enable = true;
      settings = {
        # configure noctalia here
        bar = {
          density = "compact";
          position = "right";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ]; 
            right = [
              {
                alwaysShowPercentage = false;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };

        colorSchemes.predefinedScheme = "Monochrome";
        general = {
          radiusRatio = 0.2;
        };
        location = {
          monthBeforeDay = true;
          name = "St. Louis, Missouri";
        };


      wallpaper = {
        directory = "/home/henryw/wallpapers";
        enabled = true;
        fillMode = "crop";
        randomEnabled = true;
        randomIntervalSec = 300;
        transitionDuration = 1500;
      };
    };
  };

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "~/projects/aguywhosaguy/assets/wallpapers/rusty1.jpg";
    };
  };
}
