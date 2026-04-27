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
        # telemetry opt-out
        DO_NOT_TRACK = "true";
        GH_TELEMETRY = "false";
      };

      shellAliases = import ./aliases.nix;

      initContent = ''
        # fnm
        eval "$(fnm env --use-on-cd --shell zsh)"

        # zoxide
        eval "$(zoxide init zsh)"
      '';
    };

    # Environment management
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
