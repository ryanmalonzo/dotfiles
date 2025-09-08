{ pkgs, config, lib, ... }: {
  imports = [
    ./common.nix
    ./darwin-common.nix
  ];

  config = {
    networking.hostName = "Ryans-MacBook-Air";
    networking.computerName = "Ryans-MacBook-Air";

    system.defaults.dock.persistent-apps = [
      "/Applications/Zen.app"
      "/Applications/Discord.app"
      "/Applications/Spotify.app"
      "/Applications/Ghostty.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/ProtonVPN.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.casks = [
      "bitwarden"
      "nextcloud"
      "protonvpn"
    ];
  };
}
