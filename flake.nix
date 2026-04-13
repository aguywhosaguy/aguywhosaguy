{
  description = "nixos root";

  input = {
    nixpks.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ...}@inputs: {
    nixosConfigurations.henryw = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
      ];
    };
  };
}
