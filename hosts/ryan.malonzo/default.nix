{ pkgs, config, lib, ... }: {
  imports = [
    ../common.nix
    ../darwin-common.nix
  ];

  config = {
    # networking.hostName = "ryan.malonzo";
    networking.computerName = "ryan.malonzo";

    # Work-specific packages
    environment.systemPackages = with pkgs; [
      google-cloud-sdk
      spotify
    ];
  };
}
