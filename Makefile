.PHONY: switch update clean check fmt

# Rebuild and switch to the new config
switch:
	sudo nixos-rebuild switch --flake .

# Update all flake inputs
update:
	nix flake update

# Garbage collect old generations
clean:
	sudo nix-collect-garbage -d

# Check the flake for errors without building
check:
	nix flake check

# Format nix files (requires nixfmt in your path)
fmt:
	find . -name '*.nix' -exec nixfmt {} +
