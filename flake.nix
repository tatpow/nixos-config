{

  description = "My own configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, disko, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

      nixosConfigurations.ZB-UX391F = nixpkgs.lib.nixosSystem {

        inherit system;

        modules = [
          disko.nixosModules.disko
          ./disko.nix
          ./nixos/configuration.nix
        ];
      };
    };

}
