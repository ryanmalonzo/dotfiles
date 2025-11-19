{ pkgs, config, lib, ... }: {
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
      "/Applications/Ghostty.app"
      "/Applications/Cursor.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/Tailscale.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.casks = [
      "brave-browser"
      "cursor"
      "discord"
      "google-chrome"
      "protonvpn"
    ];

    homebrew.masApps = {
      "Bitwarden" = 1352778147;
    };
  };
}
