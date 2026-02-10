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
      "/Applications/Discord.app"
      "/Applications/Spotify.app"
      "/Applications/Alacritty.app"
      "/Applications/Zed.app"
      "/Applications/Tailscale.app"
      "/Applications/Todoist.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.brews = [
      "mole"
    ];

    homebrew.casks = [
      "brave-browser"
      "claude-code"
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
