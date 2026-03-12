# nixos-config

❄️ My personal NixOS configuration with Hyprland, Home Manager, Disko, and Stylix.

## Quick Start

```bash
# Build and switch to configuration
sudo nixos-rebuild switch --flake .#ZB-UX391F

# Apply Home Manager configuration
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
nmtui  # For WiFi
```

### 3. Clone Configuration
```bash
git clone https://github.com/tatpow/nixos-config.git
cd nixos-config
```

### 4. Partition Disks (Disko)
```bash
# Check disk name first!
lsblk

# IMPORTANT: Update disko.nix with your disk device
nix run github:nix-community/disko -- --mode zap_create_mount ./disko.nix
```

### 5. Install NixOS
```bash
nixos-install --flake .#ZB-UX391F
```

### 6. Set Password
```bash
nixos-enter --root /mnt -c 'passwd tatpow'
```

### 7. Reboot
```bash
reboot
```

### 8. Apply Home Manager
```bash
home-manager switch --flake .#tatpow
```

## Git Commands

### Clone
```bash
git clone https://github.com/tatpow/nixos-config.git
cd nixos-config
```

### Pull Latest Changes
```bash
git pull
```

### Commit and Push Changes
```bash
git add .
git commit -m "description"
git push
```

### Check Status
```bash
git status
git log --oneline
```

## Update System

```bash
# Pull latest changes
git pull

# Rebuild NixOS
sudo nixos-rebuild switch --flake .#ZB-UX391F

# Update Home Manager
home-manager switch --flake .#tatpow
```

## Update Flake Inputs

```bash
# Update all inputs
nix flake update

# Update specific input
nix flake update nixpkgs
nix flake update stylix
```

## Rollback

```bash
# Rollback to previous generation
sudo nixos-rebuild switch --rollback

# List generations
nixos-rebuild list-generations

# Switch to specific generation
sudo nix-env --switch-generation 1
sudo nixos-rebuild switch
```

## Garbage Collection

```bash
# Manual GC (remove old generations)
sudo nix-collect-garbage -d

# Auto GC is configured (weekly, 30 days)
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
# Update disko.nix device path
```

### Home Manager Not Found
```bash
nix run home-manager -- switch --flake .#tatpow
```

### Hyprland Not Starting
```bash
# Check if GDM is running
systemctl status display-manager

# Check Hyprland
hyprland --version
```

### Black Screen After GDM
```bash
# Try TTY (Ctrl+Alt+F2)
# Check logs
journalctl -b -u display-manager
```

## Hardware Requirements

- **UEFI system** (for systemd-boot)
- **Disk**: NVMe/SSD (update `disko.nix` device path)
- **GPU**: Intel i915 supported (PSR disabled)
- **RAM**: 8GB+ recommended

## Post-Installation

### Verify Installation
```bash
hostname        # ZB-UX391F
whoami          # tatpow
lsblk           # Check partitions
fastfetch       # System info
```

### Test Components
```bash
# Terminal
alacritty

# Editor
micro

# Lock screen
hyprlock

# App launcher
wofi --show drun
```

## License

MIT License
