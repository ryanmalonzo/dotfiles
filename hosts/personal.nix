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
      age
      ansible
      biome
      bun
      mas
      sops
      terraform
    ];

    system.defaults.dock.persistent-apps = [
      "/Applications/Brave Browser.app"
      "/Applications/Legcord.app"
      "/Applications/Calendar.app"
      "/Applications/Spotify.app"
      "/Applications/Alacritty.app"
      "/Applications/Zed.app"
      "/Applications/Tailscale.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.brews = [
      "mole"
    ];

    homebrew.casks = [
      "brave-browser"
      "claude-code"
      "google-chrome"
      "legcord"
      "protonvpn"
      "zed"
    ];

    homebrew.masApps = {
      "Bitwarden" = 1352778147;
    };
  };
}
