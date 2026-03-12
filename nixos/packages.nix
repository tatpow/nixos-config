{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    micro
    pciutils
    usbutils
    inetutils
    git
    wofi
    waybar
    hyprlock
    grim
    slurp
    wl-clipboard
  ];
}
