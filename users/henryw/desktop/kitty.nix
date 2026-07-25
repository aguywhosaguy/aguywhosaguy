{ pkgs, config, inputs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      allow_remote_control = "yes";
      
      background_opacity = "0.6";
      background_blur = 1;

      cursor_trail = 10;
      cursor_trail_start_threshold = 2;
      cursor_trail_decay = "0.01 0.15";

      dynamic_background_opacity = true;

      window_padding_width = 5;
    };
  };
}
