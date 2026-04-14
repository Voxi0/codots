# modules/home/browser.nix
{pkgs, ...}: {
  programs.firefox = {
    enable = true;
  };

  home.packages = with pkgs; [
    chromium
    brave # alternative to google-chrome
    google-chrome # google chrome (you had it installed)
  ];
}
