# modules/home/apps.nix
# Desktop apps, gaming, comms
{pkgs, ...}: {
  home.packages = with pkgs; [
    # Communication
    vesktop # discord client (vencord)
    discord # discord (official)
    thunderbird # email
    protonmail-desktop # proton mail

    # Gaming
    steam
    lutris # game manager (wine, proton, etc.)
    wine-staging
    prismlauncher # minecraft launcher (replaces mojang launcher)

    # 3D Printing
    bambu-studio # bambu lab slicer

    # Utilities
    flameshot # screenshots
    ghostty # terminal (alternative to alacritty)
    scrcpy # android screen mirroring
    parsec-bin # remote desktop / gaming
    gparted # partition manager
  ];
}
