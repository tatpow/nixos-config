{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # All moved to ../home-manager/home-packages.nix
  ];
}
