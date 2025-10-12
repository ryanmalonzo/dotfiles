{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # Nix configuration
  nix = {
    enable = false;
  };

  environment.systemPackages = with pkgs; [
    ansible
    biome
    cargo
    coreutils
    curl
    eslint_d
    fnm
    glow
    go
    neovim
    prettierd
    stylua
    tealdeer
    terraform
    wget
  ];
}
