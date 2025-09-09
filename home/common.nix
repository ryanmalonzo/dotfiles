{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  # Add npm global bin directory to PATH
  home.sessionPath = [ "$HOME/.npm-global/bin" ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.blex-mono

    # CLI tools
    ast-grep
    bat
    eza
    fd
    fzf
    httpie
    lazygit
    ripgrep
    tree
    tree-sitter
    zoxide

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
    tree = "eza --oneline --icons --tree --level 1 --group-directories-first";

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
