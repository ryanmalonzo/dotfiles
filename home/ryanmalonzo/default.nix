{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ryanmalonzo";
  home.homeDirectory = "/Users/ryanmalonzo";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Add npm global bin directory to PATH
  home.sessionPath = [ "$HOME/.npm-global/bin" ];

  home.packages = with pkgs; [
    # CLI tools
    bat
    eza
    fzf
    httpie
    lazygit
    tree
    zoxide

    # Development tools
    ripgrep
    tree-sitter

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

  imports = [
    ../common.nix
    ../darwin-common.nix
    ../../programs/bat
    ../../programs/firefox
    ../../programs/git/personal.nix
    ../../programs/shell
    ../../programs/thefuck
  ];
}
