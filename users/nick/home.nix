{ pkgs, config, inputs, ...}:

{

  imports = [
	./shell
	./desktop
	./pkgs.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";

  home.stateVersion = "25.11";
}
