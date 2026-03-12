{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    fastfetch
    cliphist
    bemoji
  ];
}
