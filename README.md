# nixos-config

❄️ My personal NixOS configuration with Hyprland, Home Manager, Disko, and Stylix.

## Quick Start

```bash
sudo nixos-rebuild switch --flake .#ZB-UX391F
home-manager switch --flake .#tatpow
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
│       ├── boot.nix           # Bootloader (systemd-boot)
│       ├── gc.nix             # Garbage collection
│       ├── hyprland.nix       # Hyprland + GDM
│       ├── i915.nix           # Intel GPU settings
│       ├── kernel.nix         # Linux kernel
│       ├── net.nix            # NetworkManager
│       ├── nix.nix            # Nix settings (flakes)
│       ├── timezone.nix       # Timezone
│       ├── user.nix           # User configuration
│       └── env.nix            # Environment variables
└── home-manager/
    ├── home.nix               # Home Manager configuration
    ├── home-packages.nix      # User packages
    └── modules/
        ├── alacritty.nix      # Terminal emulator
        ├── hyprland.nix       # WM configuration
        └── stylix.nix         # Theming (Dracula)
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
mkdir -p /etc/nix
echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
```

### 4. Clone Configuration
```bash
git clone https://github.com/tatpow/nixos-config.git
cd nixos-config
```

### 5. Partition Disks (Disko)
```bash
lsblk  # Check disk name first!
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

### 9. Apply Home Manager
```bash
home-manager switch --flake .#tatpow
```

## Features

| Feature | Description |
|---------|-------------|
| 📦 **Flakes** | Reproducible builds |
| 💾 **Disko** | Automatic disk partitioning |
| 🏠 **Home Manager** | User environment management |
| 🎨 **Stylix** | Dracula theme auto-configuration |
| 🪟 **Hyprland** | Wayland compositor |
| 🔐 **GDM** | Graphical login screen |
| 🔒 **hyprlock** | Screen locker |
| 🗑️ **Auto GC** | Weekly garbage collection |
| 📶 **NetworkManager** | WiFi management |
| 🐧 **Latest Kernel** | linuxPackages_latest |

## Default Keybindings

| Key | Action |
|-----|--------|
| `SUPER + RETURN` | Open terminal |
| `SUPER + Q` | Close window |
| `SUPER + F` | Toggle floating |
| `SUPER + D` | App launcher (wofi) |
| `SUPER + L` | Lock screen |
| `SUPER + SHIFT + Q` | Exit Hyprland |
| `SUPER + 1-9` | Switch workspace |
| `SUPER + SHIFT + 1-9` | Move window to workspace |
| `SUPER + Mouse Drag` | Move/resize window |

## Configuration Reference

| File | Purpose |
|------|---------|
| `flake.nix` | Main entry point, inputs/outputs |
| `disko.nix` | Disk layout (ESP, swap, root) |
| `nixos/configuration.nix` | Hostname, stateVersion |
| `nixos/packages.nix` | System-wide packages |
| `nixos/modules/hyprland.nix` | Hyprland + GDM |
| `home-manager/home-packages.nix` | User packages |
| `home-manager/modules/stylix.nix` | Theming, fonts, icons |
| `home-manager/modules/hyprland.nix` | WM keybindings |
| `home-manager/modules/alacritty.nix` | Terminal config |

## Troubleshooting

### WiFi Not Working
```bash
systemctl status NetworkManager
nmcli device wifi list
rfkill unblock all
```

### Disko Fails
```bash
lsblk  # Check disk name
```

### Home Manager Not Found
```bash
nix run home-manager -- switch --flake .#tatpow
```

### Hyprland Not Starting
```bash
systemctl status display-manager
hyprland --version
```

## License

MIT License
