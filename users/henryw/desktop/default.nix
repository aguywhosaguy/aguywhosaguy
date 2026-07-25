{ pkgs, config, inputs, ...}:

{
  imports = [
    ./hyprland.nix
    ./niri.nix
    ./dms.nix
    ./flameshot.nix
    ./spicetify.nix
    ./noctalia.nix
    ./kitty.nix
    ./kdeconnect.nix
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
