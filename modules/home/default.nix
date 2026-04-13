# modules/home/default.nix
# Home-manager entry point. One import per app/concern.
{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./terminal.nix
    ./browser.nix
    ./media.nix
    ./dev.nix
    ./apps.nix
    ./security.nix
  ];

  home.stateVersion = "24.11";

  # CLI essentials
  home.packages = with pkgs; [
    htop
    btop
    ripgrep
    fd
    bat
    eza
    fzf
    jq
    unzip
    p7zip
    neofetch
    tree
    file
    binwalk
    xorriso             # ISO manipulation
    mtools              # FAT filesystem tools
    ntfs3g              # NTFS support
    usbutils
    pciutils
  ];
}
