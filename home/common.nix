{ config, lib, pkgs, ... }:

{
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  # Add npm global bin directory to PATH
  home.sessionPath = [ "$HOME/.npm-global/bin" ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.commit-mono

    # General tools
    bat
    eza
    fd
    fzf
    lazygit
    ripgrep
    zoxide

    # Lua tools
    luarocks

    # Python tools
    black
    direnv
    isort
    uv

    # Node tools
    nodejs
    nodePackages.pnpm
    nodePackages.typescript

    # Go tools
    go

    # File viewers
    csview
    jless
  ];

  programs.zsh = {
    shellAliases = {
      # eza aliases
      ls = "eza --oneline --icons --group-directories-first";
      tree = "ls --tree --level=1";

      # bat alias
      cat = "bat";

      # zoxide aliases
      cd = "z";
      ci = "zi";
    };

    # Early return for VS Code and Cursor terminals
    initContent = lib.mkBefore ''
      if [[ "$TERM_PROGRAM" == "vscode" ]] || [[ "$TERM_PROGRAM" == "cursor" ]]; then
        return
      fi
    '';
  };

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        indent_size = 2;
        indent_style = "space";
        end_of_line = "lf";
        insert_final_newline = true;
        trim_trailing_whitespace = true;
      };

      "*.{md,mdx,diff}" = {
        trim_trailing_whitespace = false;
      };

      "*.py" = {
        indent_size = 4;
      };

      "*.{cmd,bat,ps1}" = {
        end_of_line = "crlf";
      };
    };
  };

  ## Unmanaged config files

  # Alacritty
  home.file.".config/alacritty/alacritty.toml" = {
    source = ../config/alacritty/alacritty.toml;
    recursive = true;
  };
  home.file.".config/alacritty/colors.toml" = {
    source = ../config/alacritty/colors.toml;
    recursive = true;
  };

  # eza
  home.file.".config/eza/theme.yml" = {
    source = ../config/eza/theme.yml;
    recursive = true;
  };

  # Ghostty
  home.file.".config/ghostty/config" = {
    source = ../config/ghostty/config;
    recursive = true;
  };
  # lazygit
  home.file.".config/lazygit/config.yml" = {
    source = ../config/lazygit/config.yml;
    recursive = true;
  };

  # Raycast
  home.file."Desktop/raycast.rayconfig" = {
    source = ../config/raycast/raycast.rayconfig;
  };

  imports = [
    ./darwin-common.nix
    ../programs/bat
    ../programs/shell
    ../programs/thefuck
  ];
}
