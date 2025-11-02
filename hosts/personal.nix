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
      "/Applications/Helium.app"
      "/Applications/Discord.app"
      "/Applications/Spotify.app"
      "/Applications/Kitty.app"
      "/Applications/Cursor.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/Tailscale.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.casks = [
      "cursor"
      "discord"
      "google-chrome"
      "helium-browser"
      "protonvpn"
    ];

    homebrew.masApps = {
      "Bitwarden" = 1352778147;
    };
  };
}
