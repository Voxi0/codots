# modules/desktop/display.nix
{ config, pkgs, ... }:

{
  # Pick one. Uncomment the block you want.

  # ── KDE Plasma (you had this on Zorin) ──
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # ── GNOME ──
  # services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # ── Hyprland (wayland tiling) ──
  # programs.hyprland.enable = true;

  # OpenGL / GPU
  hardware.graphics.enable = true;
  # hardware.nvidia.modesetting.enable = true;  # uncomment for nvidia
}
