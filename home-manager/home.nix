{ pkgs, inputs, ... }: {
  imports = [
    inputs.stylix.homeModules.stylix
    ./home-packages.nix
    ./modules
  ];

  home = {
    username = "tatpow";
    homeDirectory = "/home/tatpow";
    stateVersion = "25.11";
  };
}
