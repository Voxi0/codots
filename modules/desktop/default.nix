# modules/desktop/default.nix
# Desktop-specific config. Import individual modules here.
{ config, pkgs, ... }:

{
  imports = [
    ./display.nix
    ./audio.nix
    ./fonts.nix
  ];
}
