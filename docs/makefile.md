# Makefile

The Makefile provides convenient shortcuts for common maintenance tasks.

## Targets

| Target | Command | Description |
|--------|---------|-------------|
| `switch` | `make switch` | Rebuilds the system configuration and switches to it. This is the equivalent of `sudo nixos-rebuild switch --flake .`. Run this after editing any `.nix` file. |
| `update` | `make update` | Updates all flake inputs (nixpkgs, home-manager) to the latest commits. |
| `clean` | `make clean` | Garbage collects old system generations and Nix store paths to free up disk space. |
| `check` | `make check` | Runs `nix flake check` to verify the configuration parses correctly and has no errors, without building anything. |
| `fmt` | `make fmt` | Formats all `.nix` files using `nixfmt`. Requires `nixfmt` to be installed. |

## Why use Makefile?

It saves typing the full `nixos-rebuild` command and makes the workflow feel more standard.
`make switch` is the most common command you'll run.