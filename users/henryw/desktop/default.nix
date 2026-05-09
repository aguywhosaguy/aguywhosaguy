{ pkgs, config, inputs, ...}:

{
  imports = [
    ./hyprland.nix
    ./flameshot.nix
    ./noctalia.nix
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    iconTheme = {
      name = "Nordzy-dark";
      package = pkgs.nordzy-icon-theme;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Nordzy-hyprcursors";
    size = 24;

    package = pkgs.nordzy-cursor-theme;

    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
