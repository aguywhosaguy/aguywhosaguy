{ pkgs, config, inputs, ...}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    settings = {
      exec-once = [
        "ambxst"
        "vicinae server"
      ];

      "$mod" = "SUPER";
      bind = 
      [
        "$mod, T, exec, ghostty"
        "SHIFT, f1, exec, flameshot gui"

        "$mod, up, resizeactive, 0 -50"
        "$mod, down, resizeactive, 0 50"
        "$mod, left, resizeactive, -50 0"
        "$mod, right, resizeactive, 50 0"

        "super shift, F23, layoutmsg, togglesplit"

        "$mod, Num_Lock, killactive"
        "ALT, F4, killactive"
        "$mod, [0-9], workspace, [1-10]"

        ", XF86MonBrightnessUp, exec, brightnessctl s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ", XF86AudioMute, exec, pactl set-sink-volume @DEFAULT_SINK@ 0%"
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
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

      env = [
        "HYPRCURSOR_THEME,Nordzy-hyprcursors"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_THEME,Nordzy-cursors"
        "XCURSOR_SIZE,24"
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

      general = {
        resize_on_border = true;
      };

      dwindle = {
        preserve_split = true;
      };

      extraConfig = ''
        source = ~/.local/share/ambxst/hyprland.conf
      '';
    };
  };

}
