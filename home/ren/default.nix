{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ren";
  home.homeDirectory = "/Users/ren";

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

  home.packages = with pkgs; [
    # CLI tools
    bat
    eza
    fzf
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
    
    # Node tools
    nodejs
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
    ../../programs/bat
    ../../programs/git/personal.nix
    ../../programs/shell
  ];
}
