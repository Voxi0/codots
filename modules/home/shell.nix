# modules/home/shell.nix
_: {
  programs = {
    bash = {
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

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[>](bold green)";
          error_symbol = "[>](bold red)";
        };
      };
    };

    fzf.enable = true;
    zoxide.enable = true;
  };
}
