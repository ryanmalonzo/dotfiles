{ pkgs, config, lib, ... }: {
  imports = [
    ./common.nix
    ./darwin-common.nix
  ];

  config = {
    networking.hostName = "Ryans-MacBook-Pro";
    networking.computerName = "Ryans-MacBook-Pro";

    environment.systemPackages = with pkgs; [
      mas
    ];

    system.defaults.dock.persistent-apps = [
      "/Applications/Vivaldi.app"
      "/Applications/Discord.app"
      "/Applications/Spotify.app"
      "/Applications/Ghostty.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/ProtonVPN.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.casks = [
      "nextcloud"
      "protonvpn"
    ];

    homebrew.masApps = {
      "Bitwarden" = 1352778147;
    };
  };
}
