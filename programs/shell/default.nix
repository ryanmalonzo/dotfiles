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
    };

    # Environment management
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
} 