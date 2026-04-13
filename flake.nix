{
  description = "nixos root";

  inputs = {
    nixpks.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: {
    nixosConfigurations = {
      nimonix = nixpkgs.lib.nixosSystem {
        modules = [ 
          ./configuration.nix

	  home-manager.nixosModules.home-manager
	  {
            home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.henryw = import ./home.nix;
	  }
        ];
      };
    };
  };
}
