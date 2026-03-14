{ pkgs, inputs, ... }: {
  imports = [
    ./home-packages.nix
    ./modules
  ];

  home = {
    username = "tatpow";
    homeDirectory = "/home/tatpow";
    stateVersion = "25.11";
  };
}
