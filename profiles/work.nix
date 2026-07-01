{
  username = "ryan.malonzo";
  homeDirectory = "/Users/ryan.malonzo";
  hostname = "D46HNH3H22";
  timeZone = "Europe/Paris";

  gitName = "Ryan Malonzo";
  gitEmail = "ryan.malonzo@spendesk.com";
  gitSigningKeyPub = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3VolUY+dMMyQoCZQS2XhWAgyEH9EFhiDsbWpH6IAod";

  extraBrews = [
    "cloudflared" # nixpkgs package doesn't build on 26.05
  ];
  extraCasks = [
    "postman"
    "tableplus"
    "yubico-authenticator"
  ];

  dockApps = [
    "/Applications/Brave Browser.app"
    "/Applications/Slack.app"
    "/Applications/kitty.app"
    "/Applications/Zed.app"
    "/Applicatons/TablePlus.app"
    "/Applications/Spotify.app"
    "/System/Applications/System Settings.app"
  ];
}
