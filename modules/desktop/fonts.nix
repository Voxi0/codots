{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      fira-code-symbols
      jetbrains-mono

      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      monospace = ["JetBrains Mono"];
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
    };
  };
}
