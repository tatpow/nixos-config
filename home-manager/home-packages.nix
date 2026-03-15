{ pkgs, ... }: {
  home.packages = with pkgs; [
    fastfetch
    cliphist
    bemoji
    micro
    hyprlock
    brightnessctl

    wev
  ];
}
