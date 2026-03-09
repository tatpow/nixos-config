{ pkgs, ... }: {
  networking.networkmanager.enable = true;
  
  hardware.enableRedistributableFirmware = true;
}
