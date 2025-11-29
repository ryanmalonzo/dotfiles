{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # Nix configuration
  nix = {
    enable = false;
  };

  # System-level packages: core utilities needed system-wide or for maintenance
  environment.systemPackages = with pkgs; [
    coreutils
    curl
    wget
  ];
}
