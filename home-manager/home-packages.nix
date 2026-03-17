{ pkgs, ... }: {
  home.packages = with pkgs; [
    fastfetch
    cliphist
    bemoji
    hyprlock
    brightnessctl
    wofi
    hyprpicker
    wl-clipboard
    waybar
    pavucontrol
    networkmanagerapplet
    blueman
    swaync
  ];
}
