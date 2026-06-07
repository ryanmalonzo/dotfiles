{
  gitName,
  gitEmail,
  gitSigningKeyPub,
  config,
  ...
}:
{
  home.file.".config/git/allowed_signers".text = "${gitEmail} ${gitSigningKeyPub}\n";

  programs.git = {
    enable = true;
    settings = {
      commit.gpgSign = true;
      core = {
        editor = "nvim";
        pager = "delta";
        sshCommand = "ssh -i ${config.sops.secrets.git_signing_key.path} -o IdentitiesOnly=yes";
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
      gpg.ssh.allowedSignersFile = "${config.home.homeDirectory}/.config/git/allowed_signers";
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
