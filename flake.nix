{
  description = "nixos root";

  inputs = {
    nixpks.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: {
    nixosConfigurations = {
      nimonix = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
	modules = [ 
          ./configuration.nix

	  home-manager.nixosModules.home-manager
	  {
            home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };

	    home-manager.users.henryw = import ./home.nix;
	  }
        ];
      };
    };
  };
}
