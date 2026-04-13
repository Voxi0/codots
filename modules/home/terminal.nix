# modules/home/terminal.nix
{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 8; y = 8; };
        opacity = 0.95;
      };
      font = {
        normal.family = "JetBrains Mono";
        size = 12.0;
      };
      colors.primary = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };
    };
  };
}
