{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.sessionPath = [
    # Add npm global bin directory to PATH
    "$HOME/.npm-global/bin"
    "$HOME/go/bin"
  ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # Fonts
    nerd-fonts.geist-mono

    # CLI tools & productivity
    bat
    eza
    fd
    fzf
    gh
    glow
    lazygit
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    ripgrep
    tree-sitter
    tealdeer
    zoxide

    # Development tools
    cargo
    direnv
    fnm

    # Lua tools
    luarocks

    # Python tools
    black
    isort
    uv

    # Node tools
    nodejs
    nodePackages.pnpm
    nodePackages.typescript

    # Go tools
    go

    # Nix tools
    colmena
    deadnix
    nixfmt-rfc-style
    nixd
    statix

    # File viewers
    csview
    jless
  ];

  home.activation.installNpmPackages =
    let
      npmPackages = [
        "@typescript/native-preview@beta"
      ];
    in
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      run ${pkgs.nodejs}/bin/npm install -g --prefix $HOME/.npm-global ${lib.concatStringsSep " " npmPackages}
    '';

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
      if [[ "$TERM_PROGRAM" == "vscode" ]] || [[ "$TERM_PROGRAM" == "cursor" ]] || [[ "$TERM_PROGRAM" == "zed" ]]; then
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

  # eza
  home.file.".config/eza/theme.yml" = {
    source = ../config/eza/theme.yml;
    recursive = true;
  };

  # Ghostty
  home.file.".config/ghostty/config.ghostty" = {
    source = ../config/ghostty/config.ghostty;
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

  # Zed
  home.file.".config/zed/settings.json" = {
    source = ../config/zed/settings.json;
  };

  # OpenCode
  home.file.".config/opencode/opencode.json" = {
    source = ../config/opencode/opencode.json;
  };

  imports = [
    ./darwin-common.nix
    ../programs/bat
    ../programs/shell
    ../programs/tmux
  ];
}
