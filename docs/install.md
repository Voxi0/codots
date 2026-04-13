# Installing on New Hardware

This guide assumes you are installing NixOS on a fresh machine.

## Prerequisites

1. **Boot the installer**: Use the NixOS live ISO.
2. **Internet**: Connect to WiFi (`wpa_supplicant` or `nmtui`) or ethernet.

## Steps

### 1. Partitioning

Use `parted` or `fdisk` to create partitions. For UEFI:

- Partition 1: EFI System (512MB, fat32, boot flag on)
- Partition 2: Linux (remaining space)

Example using `fdisk`:

```bash
fdisk /dev/sda
# o (new label)
# n (new partition) -> p (primary) -> 1 -> +512M -> t (type) -> 1 (EFI)
# n -> p -> 2 -> default -> default
# w (write)
```

Format:

```bash
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2
```

Mount:

```bash
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
```

### 2. Generate Config

NixOS can generate a base config for you:

```bash
nixos-generate-config --root /mnt
```

This generates `/mnt/etc/nixos/hardware-configuration.nix` (save this to `hosts/<your-host>/hardware-configuration.nix`) and `/mnt/etc/nixos/configuration.nix`.

### 3. Apply Codots

1. Clone your repo:

   ```bash
   cd /mnt/etc/nixos
   git clone https://github.com/constructor2828-web/codots .
   ```

   (Or move the generated files into the repo structure manually).

2. Edit `flake.nix`: Change `username` and `hostname`.

3. Edit `hosts/default/hardware-configuration.nix`: Paste the content generated in step 2.

4. Run:

   ```bash
   sudo nixos-rebuild switch --flake .#nixos
   ```

   (Replace `nixos` with your hostname in `flake.nix`).

### 4. Post-Install

- Set password: `passwd`
- Rebuild: `make switch`
- Update: `make update`