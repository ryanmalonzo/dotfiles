{
  pkgs,
  config,
  lib,
  ...
}:
{
  config = {
    # networking.hostName = "ryan.malonzo";
    networking.computerName = "ryan.malonzo";

    environment.systemPackages = with pkgs; [
      google-cloud-sdk
      spotify
    ];
  };
}
