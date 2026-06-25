{ pkgs, config, inputs, ...}:

{

  imports = [
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";

  home.stateVersion = "25.11";
}
