# Modules

This repo uses a modular approach. Each functionality is isolated in its own `.nix` file.

## NixOS Modules (System)

Located in `modules/desktop/` and `modules/server/`.

| Module | Description |
|--------|-------------|
| `desktop/display.nix` | Desktop environment (KDE Plasma, GNOME, Hyprland). Only one should be enabled at a time (uncomment the block you want). |
| `desktop/audio.nix` | Pipewire setup for audio. |
| `desktop/fonts.nix` | Font configuration (free and unfree fonts). |
| `server/ssh.nix` | SSH daemon configuration. |

### Enabling/Disabling

To disable a module, comment out the import in `hosts/default/configuration.nix`:

```nix
imports = [
  # ./hardware-configuration.nix
  ../../modules/desktop
  # ../../modules/server  # <--- Commented out
];
```

Alternatively, you can override options if the module exposes options.

## Home Manager Modules (User)

Located in `modules/home/`.

| Module | Description |
|--------|-------------|
| `home/shell.nix` | Bash, Starship prompt, FZF, Zoxide. |
| `home/git.nix` | Git configuration and aliases. |
| `home/terminal.nix` | Terminal apps (Alacritty, Tmux). |
| `home/browser.nix` | Browser settings (Firefox). |
| `home/media.nix` | Media tools (VLC, etc.). |
| `home/dev.nix` | Development tools (VS Code extensions, etc.). |
| `home/apps.nix` | GUI apps (Spotify, Discord, etc.). |
| `home/security.nix` | Security tools (GPG, SSH agent). |

### Example: Enabling `starship`

`starship` is enabled in `shell.nix`. It is configured via `programs.starship`.

```nix
programs.starship = {
  enable = true;
  settings = {
    add_newline = false;
    # ...
  };
};
```

To disable it, set `enable = false`:

```nix
programs.starship.enable = false;
```

Or simply remove the module from `modules/home/default.nix` imports.