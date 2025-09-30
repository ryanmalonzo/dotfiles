{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # Nix configuration
  nix = {
    enable = false;
  };

  environment.systemPackages = with pkgs; [
    ansible
    cargo
    coreutils
    curl
    fnm
    glow
    go
    neovim
    prettierd
    tealdeer
    terraform
    wget
  ];
}
