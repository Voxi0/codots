# modules/home/git.nix
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Your Name";          # change this
    userEmail = "your@email.here";   # change this
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "micro";
    };
    aliases = {
      st = "status -sb";
      co = "checkout";
      br = "branch";
      cm = "commit -m";
      lg = "log --oneline --graph --decorate";
    };
  };
}
