{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  # Add npm global bin directory to PATH
  home.sessionPath = [ "$HOME/.npm-global/bin" ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.geist-mono

    # General tools
    bat
    eza
    fd
    fzf
    lazygit
    ripgrep
    zellij
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

    # File viewers
    csview
    jless
  ];

  programs.zsh.shellAliases = {
    # eza aliases
    ls = "eza --oneline --icons --group-directories-first";
    tree = "ls --tree --level=1";

    # bat alias
    cat = "bat";

    # zoxide aliases
    cd = "z";
    ci = "zi";
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

  # eza
  home.file.".config/eza/theme.yml" = {
    source = ../config/eza/theme.yml;
    recursive = true;
  };

  # Kitty
  home.file.".config/kitty" = {
    source = ../config/kitty;
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

  # Zellij
  home.file.".config/zellij" = {
    source = ../config/zellij;
    recursive = true;
  };

  imports = [
    ./darwin-common.nix
    ../programs/bat
    ../programs/shell
    ../programs/thefuck
  ];
}
