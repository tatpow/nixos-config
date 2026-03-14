{ pkgs, inputs, ... }: {
  imports = [
    ./home-packages.nix
    ./modules
  ];

  home-manager.users.tatpow = {
    home.username = "tatpow";
    home.homeDirectory = "/home/tatpow";
    home.stateVersion = "25.11";
  };
}
