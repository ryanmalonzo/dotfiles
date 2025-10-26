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
      mas
      terraform
    ];

    system.defaults.dock.persistent-apps = [
      "/Applications/Helium.app"
      "/Applications/Discord.app"
      "/Applications/Spotify.app"
      "/Applications/Kitty.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/ProtonVPN.app"
      "/System/Applications/System Settings.app"
    ];

    homebrew.casks = [
      "discord"
      "helium-browser"
      "protonvpn"
    ];

    homebrew.masApps = {
      "Bitwarden" = 1352778147;
    };
  };
}
