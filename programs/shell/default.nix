{ config, pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion = {
        enable = true;
        strategy = [ "match_prev_cmd" ];
      };
      syntaxHighlighting.enable = true;

      # Environment variables
      sessionVariables = {
        EDITOR = "nvim";
        LANG = "en_US.UTF-8";
        XDG_CONFIG_HOME = "$HOME/.config";
        # npm configuration
        NPM_CONFIG_PREFIX = "$HOME/.npm-global";
      };

      # Import aliases from separate file
      shellAliases = import ./aliases.nix;

      initContent = ''
        # fnm
        eval "$(fnm env --use-on-cd --shell zsh)"

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
        direnv.disabled = false;
      };
    };

    # Environment management
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
