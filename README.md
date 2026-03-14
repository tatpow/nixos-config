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
│       ├── boot.nix           # Bootloader (systemd-boot)
│       ├── gc.nix             # Garbage collection (weekly)
│       ├── hyprland.nix       # Hyprland + GDM + hyprlock
│       ├── i915.nix           # Intel GPU settings
│       ├── kernel.nix         # Linux kernel (latest)
│       ├── net.nix            # NetworkManager
│       ├── nix.nix            # Nix settings (flakes)
│       ├── timezone.nix       # Timezone (Europe/Moscow)
│       ├── user.nix           # User configuration (tatpow)
│       ├── env.nix            # Environment variables
│       └── home-manager.nix   # Home Manager integration
└── home-manager/
    ├── home.nix               # Home Manager configuration
    ├── home-packages.nix      # User packages
    └── modules/
        ├── default.nix        # Module imports
        ├── alacritty.nix      # Terminal emulator
        ├── stylix.nix         # Theming (Dracula)
        └── hypr/
            ├── default.nix    # Module imports
            ├── hyprland.nix   # WM settings
            └── binds.nix      # Key bindings
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
| 🗑️ **Auto GC** | Weekly garbage collection (30d) |
| 📶 **NetworkManager** | WiFi management |
| 🐧 **Latest Kernel** | linuxPackages_latest |
| ⌨️ **Keyboard** | US/RU layout (Caps toggle) |
| 🖥️ **Intel GPU** | i915 PSR disabled |

## Default Keybindings

| Key | Action |
|-----|--------|
| `SUPER + RETURN` | Open terminal (Alacritty) |
| `SUPER + Q` | Close window |
| `SUPER + SHIFT + Q` | Exit Hyprland |
| `SUPER + L` | Lock screen (hyprlock) |
| `SUPER + 1-2` | Switch workspace |
| `SUPER + SHIFT + 1-2` | Move window to workspace |
| `SUPER + Mouse Drag` | Move/resize window |

> **Note:** Keybindings for floating toggle (`SUPER + F`) and app launcher (`SUPER + D`) are commented out in `binds.nix`.

## Configuration Reference

| File | Purpose |
|------|---------|
| `flake.nix` | Main entry point, inputs/outputs (nixos-25.11) |
| `disko.nix` | Disk layout (NVMe, ESP 256M, swap 8G, ext4 root) |
| `nixos/configuration.nix` | Hostname (ZB-UX391F), stateVersion |
| `nixos/packages.nix` | System-wide packages (git, micro) |
| `nixos/modules/boot.nix` | systemd-boot, kernel params, watchdog |
| `nixos/modules/gc.nix` | Auto GC (weekly, 30d) |
| `nixos/modules/hyprland.nix` | Hyprland + GDM + hyprlock + portals |
| `nixos/modules/i915.nix` | Intel GPU (PSR disabled) |
| `nixos/modules/kernel.nix` | Latest kernel |
| `nixos/modules/net.nix` | NetworkManager |
| `nixos/modules/nix.nix` | Flakes enabled |
| `nixos/modules/timezone.nix` | Europe/Moscow |
| `nixos/modules/user.nix` | User tatpow (wheel, networkmanager) |
| `nixos/modules/env.nix` | EDITOR, TERMINAL variables |
| `nixos/modules/home-manager.nix` | HM integration |
| `home-manager/home.nix` | HM entry point |
| `home-manager/home-packages.nix` | User packages (fastfetch, hyprlock, micro) |
| `home-manager/modules/stylix.nix` | Dracula theme, fonts, icons, wallpaper |
| `home-manager/modules/alacritty.nix` | Terminal (bold font) |
| `home-manager/modules/hypr/hyprland.nix` | WM settings (master layout, US/RU) |
| `home-manager/modules/hypr/binds.nix` | Key bindings |

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

### Build Flake
```bash
nix flake check
sudo nixos-rebuild switch --flake .#ZB-UX391F
```

## License

MIT License
