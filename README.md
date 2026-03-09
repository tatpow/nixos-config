# nixos-config

❄️ My personal NixOS configuration with Home Manager, Disko, and Stylix.

## Structure

```
nixos-config/
├── flake.nix              # Main flake configuration
├── disko.nix              # Disk partitioning configuration
├── nixos/
│   ├── configuration.nix  # Main NixOS configuration
│   ├── packages.nix       # System-wide packages
│   └── modules/           # NixOS modules
│       ├── boot.nix       # Bootloader settings
│       ├── gc.nix         # Automatic garbage collection
│       ├── i915.nix       # Intel i915 driver settings
│       ├── kernel.nix     # Kernel configuration
│       ├── net.nix        # Network configuration
│       ├── nix.nix        # Nix settings
│       ├── timezone.nix   # Timezone configuration
│       └── user.nix       # User configuration
└── home-manager/
    ├── home.nix           # Home Manager configuration
    ├── home-packages.nix  # User packages
    └── modules/
        └── stylix.nix     # Theming with Stylix
```

## Installation

### Prerequisites

- NixOS ISO with flakes support
- Internet connection
- UEFI system (for systemd-boot)

### Steps

1. **Boot into NixOS installer**

2. **Connect to the internet**
   ```bash
   sudo -i
   nmtui  # For WiFi
   # or
   nmcli device wifi connect "SSID" password "password"
   ```

3. **Clone the configuration**
   ```bash
   git clone https://github.com/tatpow/nixos-config.git
   cd nixos-config
   ```

4. **Configure disks with Disko**
   ```bash
   export NIX_CONFIG="experimental-features = nix-command flakes"
   
   # IMPORTANT: Change /dev/nvme0n1 to your disk name
   lsblk  # Check your disk name first
   
   nix run github:nix-community/disko -- --mode zap_create_mount ./disko.nix
   ```

5. **Install NixOS**
   ```bash
   nixos-install --flake .#ZB-UX391F
   ```

6. **Set user password**
   ```bash
   nixos-enter --root /mnt -c 'passwd tatpow'
   ```

7. **Reboot**
   ```bash
   reboot
   ```

8. **Apply Home Manager configuration**
   ```bash
   # After logging in as tatpow:
   
   # Option 1: If home-manager is available
   home-manager switch --flake .#tatpow
   
   # Option 2: If home-manager is not installed
   nix run home-manager -- switch --flake .#tatpow
   ```

## Post-Installation

### Verify installation

```bash
# Check hostname
hostname  # Should be: ZB-UX391F

# Check user
whoami  # Should be: tatpow

# Check disks
lsblk

# Check network
nmcli connection show

# Test fastfetch (after Home Manager)
fastfetch
```

### Update system

```bash
# Update system configuration
sudo nixos-rebuild switch --flake .#ZB-UX391F

# Update Home Manager
home-manager switch --flake .#tatpow
```

### Garbage collection

Garbage collection runs automatically weekly and removes generations older than 30 days.

```bash
# Manual garbage collection
sudo nix-collect-garbage -d
```

## Laptop-Specific Settings

### Intel i915 PSR Issue

If you experience screen freezing on Intel GPUs, add `i915.enable_psr=0` to kernel parameters.

**Temporary (at boot):**
1. At GRUB menu, press `e`
2. Find the line starting with `linux`
3. Add `i915.enable_psr=0` before `quiet` or at the end
4. Press `Ctrl+X` to boot

**Permanent:** Already configured in `nixos/modules/i915.nix`

## Features

- 📦 **Flakes** - Reproducible builds
- 💾 **Disko** - Automatic disk partitioning
- 🏠 **Home Manager** - User environment management
- 🎨 **Stylix** - Automatic theming (Dracula theme)
- 🗑️ **Auto GC** - Weekly garbage collection
- 📶 **NetworkManager** - WiFi management
- 🐧 **Latest kernel** - Using linuxPackages_latest

## Configuration Reference

| File | Purpose |
|------|---------|
| `flake.nix` | Main entry point, defines inputs and outputs |
| `disko.nix` | Disk layout (ESP, swap, root) |
| `nixos/configuration.nix` | Hostname, stateVersion |
| `nixos/packages.nix` | System-wide packages |
| `home-manager/home-packages.nix` | User packages (fastfetch) |
| `home-manager/modules/stylix.nix` | Theming, fonts, icons |

## Troubleshooting

### WiFi not working

```bash
# Check NetworkManager status
systemctl status NetworkManager

# Check WiFi adapter
ip link show

# Unblock WiFi
rfkill unblock all

# List available networks
nmcli device wifi list
```

### Disko fails

```bash
# Check disk name
lsblk

# Update disko.nix with correct device name
# device = "/dev/nvme0n1"  # Change this
```

### Home Manager command not found

```bash
# Use nix run instead
nix run home-manager -- switch --flake .#tatpow
```

## License

MIT License
