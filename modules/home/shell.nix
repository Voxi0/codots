# modules/home/shell.nix
{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -la --icons";
      cat = "bat --style=plain";
      g = "git";
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };
    };
  };

  programs.fzf.enable = true;
  programs.zoxide.enable = true;
}
