# modules/home/default.nix
# Home-manager entry point. One import per app/concern.
{
  pkgs,
  username,
  ...
}: {
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

  home = {
    # Username and user home directory
    inherit username;
    homeDirectory = "/home/${username}";

    # CLI essentials
    packages = with pkgs; [
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
      fastfetch
      tree
      file
      binwalk
      xorriso # ISO manipulation
      mtools # FAT filesystem tools
      ntfs3g # NTFS support
      usbutils
      pciutils
    ];

    # Unnecessary to change
    stateVersion = "25.11";
  };
}
