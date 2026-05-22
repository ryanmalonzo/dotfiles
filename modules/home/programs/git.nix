{
  gitName,
  gitEmail,
  config,
  ...
}:
{
  programs.git = {
    enable = true;
    settings = {
      commit.gpgSign = true;
      core = {
        editor = "nvim";
        pager = "delta";
      };
      delta = {
        navigate = true;
        side-by-side = true;
      };
      diff = {
        algorithm = "histogram";
        colorMoved = "default";
      };
      fetch.prune = true;
      gpg.format = "ssh";
      init.defaultBranch = "main";
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "diff3";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.updateRefs = true;
      user = {
        email = gitEmail;
        name = gitName;
        signingKey = config.sops.secrets.git_signing_key.path;
      };
    };
  };
}
