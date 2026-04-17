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

        "$mod, [0-9], workspace, [1-10]"

        ", XF86MonBrightnessUp, exec, brightnessctl s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ] ++ (
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, ${toString (if ws == 10 then 0 else ws)}, workspace, ${toString ws}"
              "$mod SHIFT, ${toString (if ws == 10 then 0 else ws)}, movetoworkspace, ${toString ws}"
            ]
          ) 10)
        );

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
