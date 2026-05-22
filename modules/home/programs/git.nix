{
  gitName,
  gitEmail,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = gitName;
    userEmail = gitEmail;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.updateRefs = true;
      core.editor = "nvim";
      push.autoSetupRemote = true;
      fetch.prune = true;
      diff.algorithm = "histogram";
      gpg.format = "ssh";
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      delta.side-by-side = true;
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };
}
