{ ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 50000;
      save = 50000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      extended = true;
    };

    autosuggestion.enable = true;
    autosuggestion.strategy = [
      "match_prev_cmd"
      "history"
      "completion"
    ];
    historySubstringSearch.enable = true;

    shellAliases = {
      cat = "bat";
      cd = "z";
      ci = "zi";
      ccopy = "pbcopy < ";
      cpaste = "pbpaste";
      dcd = "docker compose down";
      dce = "docker compose exec";
      dcu = "docker compose up -d";
      dcp = "docker compose ps";
      gp = "git pull";
      gps = "git pull && git switch";
      gs = "git switch";
      lg = "lazygit";
      vi = "nvim";
      vim = "nvim";
      vx = "nvim .";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      direnv.disabled = false;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zoxide.enable = true;

}
