{ pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  enviroment.systemPackages = with pkgs; [
    fastfetch
  ];
}
