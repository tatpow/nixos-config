{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    micro
    #pciutils
    #usbutils
    #inetutils
    git
  ];
}
