{ pkgs, config, inputs, ...}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  
    settings = {
      exec-once = [
        "vicinae server"
	"noctalia-shell"
      ];

      "$mod" = "SUPER";
      bind = 
      [
        "$mod, T, exec, ghostty"
        "$mod, Escape, exec, forcekillactive"

        ", XF86MonBrightnessUp, exec, brightnessctl s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindr =
      [
        "$mod, SUPER_L, exec, vicinae toggle"
      ];

      layerrule = [
        "blur on, ignore_alpha 0, match:namespace vicinae"
      ];
      
      windowrule = [
        "match:initial_title Ghostty, opacity 0.75"
      ];
      
      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
      ];
    };
  };
}
