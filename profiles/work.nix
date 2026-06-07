{
  username = "ryan.malonzo";
  homeDirectory = "/Users/ryan.malonzo";
  hostname = "Ryans-MacBook-Pro";
  timeZone = "Europe/Paris";

  gitName = "Ryan Malonzo";
  gitEmail = "ryan.malonzo@spendesk.com";
  gitSigningKeyPub = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3VolUY+dMMyQoCZQS2XhWAgyEH9EFhiDsbWpH6IAod";

  extraCasks = [
    "brave-browser"
    "claude-code"
    "legcord"
    "protonvpn"
    "zed"
  ];
  extraBrews = [ "mole" ];
  dockApps = [
    "/Applications/Brave Browser.app"
    "/Applications/Legcord.app"
    "/Applications/Spotify.app"
    "/Applications/kitty.app"
    "/Applications/Zed.app"
    "/Applications/Tailscale.app"
    "/System/Applications/System Settings.app"
  ];
}
