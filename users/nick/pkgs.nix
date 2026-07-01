{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    ghostty

    inputs.zen-browser.packages.${system}.default

    helix
  ];
}
