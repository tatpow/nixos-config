{ pkgs, ... }: {
  home.packages = with pkgs; [
    fastfetch
    cliphist
    bemoji
    hyprlock
    brightnessctl
    wofi
  ];
}
