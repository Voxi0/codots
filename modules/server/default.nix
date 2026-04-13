# modules/server/default.nix
# Server-specific config. Import what you need.
{ config, pkgs, ... }:

{
  imports = [
    ./ssh.nix
    # ./docker.nix
    # ./nginx.nix
  ];
}
