{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    ./common.nix
    ./darwin-common.nix
  ];

  config = {
    networking.hostName = "Ryans-MacBook-Pro";
    networking.computerName = "Ryans-MacBook-Pro";

    environment.systemPackages = with pkgs; [
      ansible
      biome
      mas
      terraform
    ];

    system.defaults.dock.persistent-apps = [
      "/Applications/Brave Browser.app"
      "/Applications/Discord.app"
      "/Applications/Spotify.app"
      "/Applications/Alacritty.app"
      "/Applications/Zed.app"
      "/Applications/Tailscale.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.casks = [
      "brave-browser"
      "discord"
      "google-chrome"
      "protonvpn"
      "todoist-app"
      "zed"
    ];

    homebrew.masApps = {
      "Bitwarden" = 1352778147;
      "One Thing" = 1604176982;
    };
  };
}
