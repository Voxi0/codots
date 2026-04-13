# Getting Started

This is the companion documentation for [codots](https://github.com/constructor2828-web/codots), a NixOS + Home Manager flake configuration.

## Prerequisites

- **Nix**: Install from [nixos.org](https://nixos.org/download.html) or via the official installer. This config relies on flakes.
- **Flakes**: Ensure flakes are enabled in your `nix.conf`.
- **Home Manager**: Included as a flake input; no separate install needed.

## Install

1. Clone the repository:

   ```bash
   git clone https://github.com/constructor2828-web/codots ~/.codots
   cd ~/.codots
   ```

2. Review `flake.nix`. Edit the `username` and `hostname` variables at the top to match your system.

3. Test for errors:

   ```bash
   nix flake check
   ```

4. Apply the configuration:

   ```bash
   sudo nixos-rebuild switch --flake .
   ```

   Or use the Makefile target:

   ```bash
   make switch
   ```

## Update

Update flake inputs (nixpkgs, home-manager) and rebuild:

```bash
make update switch
```