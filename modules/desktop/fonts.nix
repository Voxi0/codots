# modules/desktop/fonts.nix
{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    jetbrains-mono
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrains Mono" ];
    sansSerif = [ "Noto Sans" ];
    serif = [ "Noto Serif" ];
  };
}
