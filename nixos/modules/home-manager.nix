{ inputs, pkgs-unstable, ... }: {
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { 
      inherit inputs pkgs-unstable; 
    };
    users.tatpow = import ../../home-manager/home.nix;
  };
}
