{

  description = "My own configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

  };

  outputs = { self, nixpkgs, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

      # Build configuration.nix
      nixosConfigurations.ZB-UX391F = nixpkgs.lib.nixosSystem {

        inherit inputs system;

        modules = [
          ./configuration.nix
        ];
      };
    };

}
