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

  outputs = { 
    self, 
    nixpkgs, 
    home-manager, 
    ...
  }@inputs: {
    nixosConfigurations = {
      nimonix = let
        username = "henryw";
	specialArgs = { inherit username inputs; };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs; 
          system = "x86_64-linux";

	  modules = [ 
            ./hosts/nimonix
            ./users/${username}/nixos.nix
	    home-manager.nixosModules.home-manager
	    {
              home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = specialArgs; 
	      home-manager.users.${username} = import ./users/${username}/home.nix;
	    }
          ];
        };
    };
  };
}
