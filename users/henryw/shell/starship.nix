{ pkgs, config, inputs, ...}:

{
  programs.starship = {
    enable = true;

    settings = builtins.fromTOML
      (builtins.readFile ../../../assets/tokyo-night.toml);
  };
}
