{ pkgs, config, inputs, ... }:

{
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
}
