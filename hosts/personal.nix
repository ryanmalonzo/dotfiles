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
      "/Applications/Spotify.app"
      "/Applications/Ghostty.app"
      "/Applications/Zed.app"
      "/Applications/Tailscale.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.brews = [
      "mole"
      "opencode"
    ];

    homebrew.casks = [
      "brave-browser"
      "claude-code"
      "finetune"
      "legcord"
      "protonvpn"
      "zed"
    ];

    homebrew.masApps = {
    };
  };
}
