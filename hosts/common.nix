{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # Nix configuration
  nix = {
    enable = false;
  };

  environment.systemPackages = with pkgs; [
    cargo
    coreutils
    curl
    eslint_d
    fnm
    glow
    helix
    neovim
    prettierd
    stylua
    tealdeer
    wget
  ];
}
