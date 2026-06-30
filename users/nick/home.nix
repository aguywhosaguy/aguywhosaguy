{ pkgs, config, inputs, ...}:

{

  imports = [
	./shell
	./pkgs.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";

  home.stateVersion = "25.11";
}
