# nixos-config
❄️ My own NixOS Config

# TODO: update readme

# just some commands for install:

1. `sudo -i`
2. For WIFI: `nmtui`
3. Download the config: `git clone https://github.com/tatpow/nixos-config.git`
4. `cd nixos-config`
5. Instruction for Disko.

    1. `export NIX_CONFIG="experimental-features = nix-command flakes"`
    2. `nix run github:nix-community/disko -- --mode zap_create_mount ./disko.nix`
    3. Always check disks by `lsblk`

6. `nixos-install --flake .#ZB-UX391F`
7. `nixos-enter --root /mnt -c 'passwd tatpow` - Change to yours
8. `reboot`


# JUST FOR MY LAPTOP:
Before startup full-clean install:
1. Go in GNU GRUB (by 'e' on right point)
2. BEFORE initrd, right: `i915.enable_psr=0`
Example:
`linux /boot//nix/store/wkn4hf9kzffrnpqp0cvf1qi.../bzImage ${isoboot} init=/nix/store/ly1j7icghn665dcbpabs\ qfngl1jwsr38-nixos-system-nixos-25.05.813221.9a7b80b6f82a/init \ root=LABEL=nixos-minimal-25.05-x86_64 boot.shell_on_fail loglevel\ =4 lsm=landlock,yama,bpf` + `i915.enable_psr=0`
3. Login by `Ctrl+X`
