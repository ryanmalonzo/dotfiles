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
      "/Applications/Safari.app"
      "/Applications/Discord.app"
      "/Applications/Spotify.app"
      "/Applications/Ghostty.app"
      "/Applications/WebStorm.app"
      "/Applications/ProtonVPN.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.casks = [
      "protonvpn"
    ];

    homebrew.masApps = {
      "Bitwarden" = 1352778147;
    };
  };
}
