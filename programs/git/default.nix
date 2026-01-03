{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    # Shared settings across all hosts
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "vim";
    };
  };
}
