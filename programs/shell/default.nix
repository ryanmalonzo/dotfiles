{ config, pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      # Environment variables
      sessionVariables = {
        EDITOR = "nvim";
        LANG = "en_US.UTF-8";
        XDG_CONFIG_HOME = "$HOME/.config";
      };

      # Import aliases from separate file
      shellAliases = import ./aliases.nix;

      initExtra = ''
        # zoxide
        eval "$(zoxide init zsh)"

        # starship
        eval "$(starship init zsh)"
      '';
    };

    # Shell prompt
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        direnv.disabled = false;
        git_commit.disabled = true;
        git_status.disabled = true;
      };
    };

    # Environment management
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
