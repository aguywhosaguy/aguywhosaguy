{
  description = "nixos root";

  inputs = {
    nixpks.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ...}@inputs: {
    nixosConfigurations.nimonix = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
      ];
    };
  };
}
