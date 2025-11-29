{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    # Shared settings across all hosts
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "vim";
    };
  };
}
