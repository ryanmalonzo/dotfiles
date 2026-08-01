{
  gitName,
  gitEmail,
  gitSigningKeyPub,
  config,
  ...
}:
{
  home.file.".config/git/allowed_signers".text = "${gitEmail} ${gitSigningKeyPub}\n";

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    # Must stay first in the generated config; OrbStack requires its Include
    # to precede any Host/Match blocks.
    includes = [ "~/.orbstack/ssh/config" ];
    settings."*" = {
      ForwardAgent = false;
      AddKeysToAgent = "no";
      Compression = false;
      ServerAliveInterval = 0;
      ServerAliveCountMax = 3;
      HashKnownHosts = false;
      UserKnownHostsFile = "~/.ssh/known_hosts";
      ControlMaster = "no";
      ControlPath = "~/.ssh/master-%r@%n:%p";
      ControlPersist = "no";
    };
    settings."github.com" = {
      IdentitiesOnly = true;
      IdentityFile = config.sops.secrets.git_signing_key.path;
    };
  };

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
