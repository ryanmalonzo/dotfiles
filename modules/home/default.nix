{
  lib,
  pkgs,
  self,
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
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
    SOPS_AGE_KEY_FILE = "${homeDirectory}/.config/sops/age/keys.txt";
  };

  home.packages = with pkgs; [
    cargo
    csview
    deadnix
    delta
    fd
    fnm
    fzf
    gh
    glow
    go
    jless
    neovim
    nixd
    nixfmt
    nodejs
    ripgrep
    ruff
    statix
    tfenv
    tree-sitter
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

  sops = {
    age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = "${self}/secrets/common.yaml";
    secrets.git_signing_key = { };
  };

  programs.zsh.initContent = lib.mkBefore ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';

  home.file."Desktop/raycast.rayconfig".source = ../../config/raycast/raycast.rayconfig;
  home.file."Library/Application Support/Rectangle/RectangleConfig.json".source =
    ../../config/rectangle/RectangleConfig.json;
  home.file.".config/zed/settings.json".source = ../../config/zed/settings.json;

  imports = [
    ./programs/bat.nix
    ./programs/git.nix
    ./programs/kitty.nix
    ./programs/lazygit.nix
    ./programs/shell.nix
    ./programs/tmux.nix
  ];
}
