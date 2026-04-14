# modules/home/git.nix
_: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Your Name"; # change this
      user.email = "your@email.here"; # change this
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "micro";
      aliases = {
        st = "status -sb";
        co = "checkout";
        br = "branch";
        cm = "commit -m";
        lg = "log --oneline --graph --decorate";
      };
    };
  };
}
