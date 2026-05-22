{
  lib,
  pkgs,
  username,
  homeDirectory,
  ...
}:
{
  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home.sessionPath = [
    "$HOME/.npm-global/bin"
    "$HOME/go/bin"
  ];

  home.sessionVariables = {
    DO_NOT_TRACK = "true";
    EDITOR = "nvim";
    GH_TELEMETRY = "false";
    LANG = "en_US.UTF-8";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
  };

  home.packages = with pkgs; [
    bat
    cargo
    fnm
    csview
    deadnix
    delta
    eza
    fd
    fzf
    gh
    glow
    go
    jless
    lazygit
    nixd
    nixfmt-rfc-style
    ripgrep
    ruff
    statix
    uv
  ];

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
      "*.{md,mdx,diff}".trim_trailing_whitespace = false;
      "*.py".indent_size = 4;
      "*.{cmd,bat,ps1}".end_of_line = "crlf";
    };
  };

  programs.zsh.initContent = lib.mkBefore ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';

  imports = [ ./programs/shell.nix ];
}
