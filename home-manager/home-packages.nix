{ pkgs, ... }: {
  home.packages = with pkgs; [
    # CLI utils
    bemoji
    brightnessctl
    cliphist
    fastfetch
    grimblast
    hyprpicker
    playerctl
    udisks
    wget
    wl-clipboard

    # Desktop apps
    blueman
    imv
    mpv
    networkmanagerapplet
    pavucontrol
    swaynotificationcenter

    # WM stuff
    hyprlock
    waybar
    wofi

    # Other
    ffmpeg
    ffmpegthumbnailer
    ntfs3g

    # Personal programs
    obsidian
    synology-drive-client
    yandex-music
    bitwarden-desktop
    telegram-desktop
    vesktop
    unityhub
    opentabletdriver
    krita
    gimp

    # Browser (unstable)
    pkgs-unstable.google-chrome
  ];
}
