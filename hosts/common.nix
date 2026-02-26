{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix = {
    enable = false;
  };

  environment.systemPackages = with pkgs; [
    coreutils
    curl
    wget
  ];
}
