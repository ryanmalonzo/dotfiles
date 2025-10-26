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
    fnm
    glow
    neovim
    tealdeer
    wget
  ];
}
