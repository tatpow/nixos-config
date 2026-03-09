{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    
    pciutils      # lspci
    usbutils      # lsusb
    inetutils     # ping, hostname
    git
  ];
}
