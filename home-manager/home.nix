{ pkgs, inputs, ... }: {

  imports = [
    ./home-packages.nix
    ./modules/default.nix
  ];

  home = {
    username = "tatpow";
    homeDirectory = "/home/tatpow";
  };
}
