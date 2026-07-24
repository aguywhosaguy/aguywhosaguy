{ pkgs, lib, config, inputs, ... }:

{
  imports = [ inputs.niri.homeModules.niri ];
  
  programs.niri = {
    enable = true;

    settings = lib.mkForce {
      spawn-at-startup = [
        { command = [ "vicinae" "server" ]; }
      ];

      input = {
        touchpad = {
          dwt = false;
        };
      };

      outputs."eDP-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        position = { x = 0; y = 0; };
        scale = 1.0;
      };

      cursor = {
        theme = "Nordzy-cursors";
        size = 24;
      };

      window-rules = [
        {
          matches = [ { title = "^Ghostty$"; } ];
          opacity = 0.75;
        }
      ];

      binds = with config.lib.niri.actions; {
        # ── Your existing binds (unchanged) ──
        "Mod+T".action.spawn = [ "ghostty" ];
        "Mod+C".action.spawn = [ "google-chrome" ];
        "Mod+H".action.spawn = [ "helium" "--ozone-platform=wayland" "--enable-features=WaylandWindowDecorations" ];
        "XF86Tools".action.spawn = [ "vicinae" "toggle" ];
        "Shift+F1".action.screenshot = [ ];
        "Mod+Num_Lock".action.close-window = [ ];
        "Alt+F4".action.close-window = [ ];
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+0".action.focus-workspace = 10;
        "Mod+Shift+1".action.move-column-to-workspace = [ 1 ];
        "Mod+Shift+2".action.move-column-to-workspace = [ 2 ];
        "Mod+Shift+3".action.move-column-to-workspace = [ 3 ];
        "Mod+Shift+4".action.move-column-to-workspace = [ 4 ];
        "Mod+Shift+5".action.move-column-to-workspace = [ 5 ];
        "Mod+Shift+6".action.move-column-to-workspace = [ 6 ];
        "Mod+Shift+7".action.move-column-to-workspace = [ 7 ];
        "Mod+Shift+8".action.move-column-to-workspace = [ 8 ];
        "Mod+Shift+9".action.move-column-to-workspace = [ 9 ];
        "Mod+Shift+0".action.move-column-to-workspace = [ 10 ];

        # ── Mod+Q close-window ──
        "Mod+Q" = { repeat = false; action.close-window = [ ]; };

        # ── Focus movement (H/Left/Right/Up/Down skipped — already taken by yours above) ──
        "Mod+Left".action.focus-column-left = [ ];
        "Mod+Right".action.focus-column-right = [ ];
        "Mod+Up".action.focus-window-up = [ ];
        "Mod+Down".action.focus-window-down = [ ];
        "Mod+J".action.focus-window-down = [ ];
        "Mod+K".action.focus-window-up = [ ];
        "Mod+L".action.focus-column-right = [ ];

        "Mod+Ctrl+Left"  .action.move-column-left = [ ];
        "Mod+Ctrl+Down"  .action.move-window-down = [ ];
        "Mod+Ctrl+Up"    .action.move-window-up = [ ];
        "Mod+Ctrl+Right" .action.move-column-right = [ ];
        "Mod+Ctrl+H"     .action.move-column-left = [ ];
        "Mod+Ctrl+J"     .action.move-window-down = [ ];
        "Mod+Ctrl+K"     .action.move-window-up = [ ];
        "Mod+Ctrl+L"     .action.move-column-right = [ ];

        "Mod+Home".action.focus-column-first = [ ];
        "Mod+End" .action.focus-column-last = [ ];
        "Mod+Ctrl+Home".action.move-column-to-first = [ ];
        "Mod+Ctrl+End" .action.move-column-to-last = [ ];

        # ── Focus workspace down/up ──
        "Mod+Page_Down".action.focus-workspace-down = [ ];
        "Mod+Page_Up"  .action.focus-workspace-up = [ ];
        "Mod+U"        .action.focus-workspace-down = [ ];
        "Mod+I"        .action.focus-workspace-up = [ ];

        "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [ ];
        "Mod+Ctrl+Page_Up"  .action.move-column-to-workspace-up = [ ];
        "Mod+Ctrl+U"        .action.move-column-to-workspace-down = [ ];
        "Mod+Ctrl+I"        .action.move-column-to-workspace-up = [ ];

        "Mod+Shift+Page_Down".action.move-workspace-down = [ ];
        "Mod+Shift+Page_Up"  .action.move-workspace-up = [ ];
        "Mod+Shift+U"        .action.move-workspace-down = [ ];
        "Mod+Shift+I"        .action.move-workspace-up = [ ];

        # ── Consuming / expelling windows ──
        "Mod+BracketLeft" .action.consume-or-expel-window-left = [ ];
        "Mod+BracketRight".action.consume-or-expel-window-right = [ ];
        "Mod+Period"      .action.expel-window-from-column = [ ];

        # ── Column sizing (Mod+C skipped — taken by your chrome spawn) ──
        "Mod+R"            .action.switch-preset-column-width = [ ];
        "Mod+Shift+R"      .action.switch-preset-column-width-back = [ ];
        "Mod+Ctrl+Shift+R" .action.switch-preset-window-height = [ ];
        "Mod+Ctrl+R"       .action.reset-window-height = [ ];
        "Mod+F"            .action.maximize-column = [ ];
        "Mod+Shift+F"      .action.fullscreen-window = [ ];
        "Mod+Ctrl+F"       .action.expand-column-to-available-width = [ ];
        "Mod+Ctrl+C"       .action.center-visible-columns = [ ];
        "Mod+Minus"        .action.set-column-width = "-10%";
        "Mod+Equal"        .action.set-column-width = "+10%";
        "Mod+Shift+Minus"  .action.set-window-height = "-10%";
        "Mod+Shift+Equal"  .action.set-window-height = "+10%";

        # ── Audio ──
        "XF86AudioRaiseVolume" = { allow-when-locked = true; action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" "-l" "1.0" ]; };
        "XF86AudioLowerVolume" = { allow-when-locked = true; action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ]; };
        "XF86AudioMute"        = { allow-when-locked = true; action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ]; };
        "XF86AudioMicMute"     = { allow-when-locked = true; action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ]; };

        # ── Brightness ──
        "XF86MonBrightnessUp"   = { allow-when-locked = true; action.spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ]; };
        "XF86MonBrightnessDown" = { allow-when-locked = true; action.spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ]; };
      };

     
    };
  };
}
