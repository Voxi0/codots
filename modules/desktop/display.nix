_: {
  # Pick one. Uncomment the block you want.

  # ── KDE Plasma (you had this on Zorin) ──
  services = {
    xserver.enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  # ── GNOME ──
  # services = {
  #   xserver.enable = true;
  #   xserver = {
  #     displayManager.gdm.enable = true;
  #     desktopManager.gnome.enable = true;
  #   };
  # };

  # ── Hyprland (wayland tiling) ──
  # programs.hyprland.enable = true;

  # OpenGL / GPU
  hardware.graphics.enable = true;
  # hardware.nvidia.modesetting.enable = true;  # uncomment for nvidia
}
