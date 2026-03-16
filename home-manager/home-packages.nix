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
    pavucontrol       # GUI для управления звуком (PulseAudio)
    networkmanagerapplet # GUI для NetworkManager (nm-connection-editor)
  ];
}
