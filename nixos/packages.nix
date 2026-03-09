{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    pciutils
    usbutils
    inetutils
    git
    micro
  ];
}
