{ ... }:

{
  imports = [
    ./packages.nix
    ./modules
  ];

  disabledModules = [];

  networking.hostName = "ZB-UX391F"; # Define your hostname.

  system.stateVersion = "25.11"; # Do not touch !
}
