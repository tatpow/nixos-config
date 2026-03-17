# nixos-config

❄️ My personal NixOS configuration with Hyprland, Home Manager, Disko, and Stylix.

## Quick Start

```bash
sudo nixos-rebuild switch --flake .#ZB-UX391F
```

## Structure

```
nixos-config/
├── flake.nix                  # Main flake configuration
├── disko.nix                  # Disk partitioning (Disko)
├── nixos/
│   ├── configuration.nix      # Main NixOS configuration
│   ├── packages.nix           # System-wide packages
│   └── modules/
│       ├── default.nix        # Module imports
│       ├── audio.nix          # PipeWire (ALSA, Pulse)
│       ├── bluetooth.nix      # Bluetooth + Blueman
│       ├── boot.nix           # Bootloader (systemd-boot)
│       ├── env.nix            # Environment variables
│       ├── gc.nix             # Garbage collection (weekly)
│       ├── home-manager.nix   # Home Manager integration
│       ├── hyprland.nix       # Hyprland + GDM + hyprlock
│       ├── i915.nix           # Intel GPU settings
│       ├── kernel.nix         # Linux kernel (latest)
│       ├── net.nix            # NetworkManager
│       ├── nh.nix             # nh (Nix helper)
│       ├── nix.nix            # Nix settings (flakes)
│       ├── timezone.nix       # Timezone (Europe/Moscow)
│       ├── user.nix           # User configuration (tatpow)
│       └── zram.nix           # Zram swap (lz4)
└── home-manager/
    ├── home.nix               # Home Manager configuration
    ├── home-packages.nix      # User packages
    └── modules/
        ├── default.nix        # Module imports
        ├── alacritty.nix      # Terminal emulator
        ├── chromium.nix       # Chromium + extensions (disabled)
        ├── stylix.nix         # Theming (Dracula)
        ├── swaync.nix         # Notification daemon
        ├── synology.nix       # Synology Drive Client
        ├── vscode.nix         # VS Code + extensions
        ├── hypr/
        │   ├── default.nix    # Module imports
        │   ├── binds.nix      # Key bindings
        │   ├── hypridle.nix   # Idle daemon
        │   └── hyprland.nix   # WM settings
        ├── waybar/
        │   ├── default.nix    # Waybar configuration
        │   └── style.css      # Waybar styles
        └── wofi/
            ├── default.nix    # Wofi configuration
            └── style.css      # Wofi styles (empty)
```

## Installation

### 1. Boot into NixOS Installer

### 2. Connect to Internet
```bash
sudo -i
nmtui
```

### 3. Enable Flakes
```bash
export NIX_CONFIG="experimental-features = nix-command flakes"
```

### 4. Clone Configuration
```bash
git clone https://github.com/tatpow/nixos-config.git
cd nixos-config
```

### 5. Partition Disks (Disko)
```bash
lsblk
nix run github:nix-community/disko -- --mode zap_create_mount ./disko.nix
```

### 6. Install NixOS
```bash
nixos-install --flake .#ZB-UX391F
```

### 7. Set Password
```bash
nixos-enter --root /mnt -c 'passwd tatpow'
```

### 8. Reboot
```bash
reboot
```

## Features

| Feature | Description |
|---------|-------------|
| 📦 **Flakes** | Reproducible builds (nixos-25.11) |
| 💾 **Disko** | Automatic disk partitioning (NVMe, ext4) |
| 🏠 **Home Manager** | User environment management |
| 🎨 **Stylix** | Dracula theme auto-configuration |
| 🪟 **Hyprland** | Wayland compositor (master layout) |
| 🔐 **GDM** | Graphical login screen |
| 🔒 **hyprlock** | Screen locker |
| � **hypridle** | Idle daemon (sleep, dim, lock) |
| �🗑️ **Auto GC** | Weekly garbage collection (30d) |
| 📶 **NetworkManager** | WiFi management |
| 🐧 **Latest Kernel** | linuxPackages_latest |
| ⌨️ **Keyboard** | US/RU layout (Caps toggle) |
| 🖥️ **Intel GPU** | i915 PSR disabled |
| 🔊 **PipeWire** | Audio server (ALSA, Pulse) |
| 🔵 **Bluetooth** | Blueman manager |
| 💾 **Zram** | Compressed swap (lz4, 100%) |
| 📢 **swaync** | Notification daemon |
| 🧱 **Waybar** | Status bar (custom modules) |
| 🚀 **Wofi** | Application launcher |
| 📝 **VS Code** | Editor with extensions |

## Default Keybindings

| Key | Action |
|-----|--------|
| `SUPER + RETURN` | Open terminal (Alacritty) |
| `SUPER + Q` | Close window |
| `SUPER + SHIFT + Q` | Exit Hyprland |
| `SUPER + L` | Lock screen (hyprlock) |
| `SUPER + D` | App launcher (Wofi) |
| `SUPER + F` | Toggle floating |
| `SUPER + SHIFT + F` | Toggle fullscreen |
| `SUPER + P` | Color picker (hyprpicker) |
| `SUPER + E` | Emoji picker (bemoji) |
| `SUPER + V` | Clipboard history (cliphist) |
| `SUPER + N` | Notification center (swaync) |
| `PRINT` | Screenshot (grimblast) |
| `SUPER + Arrows` | Move focus / Resize window |
| `SUPER + SHIFT + Arrows` | Swap window |
| `SUPER + 1-0` | Switch workspace |
| `SUPER + SHIFT + 1-0` | Move window to workspace |
| `SUPER + Mouse Drag` | Move/resize window |
| `XF86Audio*` | Volume / Playback control |
| `XF86MonBrightness*` | Screen brightness |

## Configuration Reference

| File | Purpose |
|------|---------|
| `flake.nix` | Main entry point, inputs/outputs (nixos-25.11) |
| `disko.nix` | Disk layout (NVMe, ESP 256M, swap 8G, ext4 root) |
| `nixos/configuration.nix` | Hostname (ZB-UX391F), stateVersion |
| `nixos/packages.nix` | System-wide packages (git) |
| `nixos/modules/default.nix` | Module imports |
| `nixos/modules/audio.nix` | PipeWire (ALSA, Pulse) |
| `nixos/modules/bluetooth.nix` | Bluetooth + Blueman |
| `nixos/modules/boot.nix` | systemd-boot, kernel params, watchdog |
| `nixos/modules/env.nix` | EDITOR, TERMINAL variables |
| `nixos/modules/gc.nix` | Auto GC (weekly, 30d) |
| `nixos/modules/home-manager.nix` | HM integration |
| `nixos/modules/hyprland.nix` | Hyprland + GDM + hyprlock + portals |
| `nixos/modules/i915.nix` | Intel GPU (PSR disabled) |
| `nixos/modules/kernel.nix` | Latest kernel |
| `nixos/modules/net.nix` | NetworkManager |
| `nixos/modules/nh.nix` | nh (Nix helper) |
| `nixos/modules/nix.nix` | Flakes enabled |
| `nixos/modules/timezone.nix` | Europe/Moscow |
| `nixos/modules/user.nix` | User tatpow (wheel, networkmanager, input) |
| `nixos/modules/zram.nix` | Zram swap (lz4, 100%) |
| `home-manager/home.nix` | HM entry point |
| `home-manager/home-packages.nix` | User packages (fastfetch, hyprlock, waybar, wofi, apps) |
| `home-manager/modules/default.nix` | Module imports |
| `home-manager/modules/stylix.nix` | Dracula theme, fonts, icons, wallpaper |
| `home-manager/modules/alacritty.nix` | Terminal (bold font) |
| `home-manager/modules/chromium.nix` | Chromium + extensions (disabled) |
| `home-manager/modules/swaync.nix` | Notification daemon |
| `home-manager/modules/synology.nix` | Synology Drive Client |
| `home-manager/modules/vscode.nix` | VS Code + extensions |
| `home-manager/modules/hypr/default.nix` | Module imports |
| `home-manager/modules/hypr/hyprland.nix` | WM settings (master layout, US/RU) |
| `home-manager/modules/hypr/binds.nix` | Key bindings |
| `home-manager/modules/hypr/hypridle.nix` | Idle daemon |
| `home-manager/modules/waybar/default.nix` | Status bar |
| `home-manager/modules/waybar/style.css` | Waybar styles (Dracula) |
| `home-manager/modules/wofi/default.nix` | App launcher |
| `home-manager/modules/wofi/style.css` | Wofi styles (empty) |

## Troubleshooting

### WiFi Not Working
```bash
systemctl status NetworkManager
nmcli device wifi list
nmcli device wifi connect <SSID>
rfkill unblock all
```

### Disko Fails
```bash
lsblk
# Update device path in disko.nix if needed
```

### Hyprland Not Starting
```bash
systemctl status display-manager
hyprland --version
journalctl -u display-manager
```

### Audio Issues
```bash
systemctl --user status pipewire
wpctl status
pavucontrol
```

### Bluetooth Issues
```bash
systemctl status bluetooth
blueman-manager
```

### Waybar Not Showing
```bash
waybar --check
journalctl --user -u waybar
```

### Wofi Not Opening
```bash
wofi --show drun
```

### hypridle Not Working
```bash
hyprctl switches
loginctl lock-session
```

### Build Flake
```bash
nix flake check
sudo nixos-rebuild switch --flake .#ZB-UX391F
```

## License

MIT License
