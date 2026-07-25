{ pkgs, config, inputs, ...}:

{
  programs.starship = {
    enable = true;

    settings = builtins.fromTOML
      (builtins.readFile /home/henryw/projects/aguywhosaguy/assets/tokyo-night.toml);
  };
}
