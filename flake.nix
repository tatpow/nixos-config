{

  description = "My own configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, disko, home-manager, stylix, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

      nixosConfigurations.ZB-UX391F = nixpkgs.lib.nixosSystem {

        system = system;

        specialArgs = {
          inherit inputs;
        };

        modules = [
          disko.nixosModules.disko
          ./disko.nix
          ./nixos/configuration.nix
        ];
      };

      homeConfigurations.tatpow = home-manager.lib.homeManagerConfiguration {

        pkgs = nixpkgs.legacyPackages.${system};

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [ ./home-manager/home.nix ];

      };
    };

}
