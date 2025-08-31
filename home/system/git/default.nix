{ config, ... }:
let
  username = config.var.git.username;
  email = config.var.git.email;
in
{
  programs.git = {
    enable = true;

    userName = username;
    userEmail = email;

    ignores = [
      ".cache/"
      ".direnv/"
      "node_modules"

      ".DS_Store"
      ".idea"
      "*.swp"
      "*.elc"

      "result"
      "result-*"

      "auto-save-list"
    ];

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      color.ui = "1";
    };

    aliases = {
      s = "status";
    };
  };
}
