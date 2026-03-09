{ pkgs, ... }: {

  imports = [
    ./packages.nix
    ./modules
  ];

  disabledModules = [];

  networking.hostName = "ZB-UX391F";

  system.stateVersion = "25.11";
}
