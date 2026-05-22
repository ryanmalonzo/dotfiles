{
  username,
  homeDirectory,
  hostname,
  timeZone,
  ...
}:
{
  nix.enable = false;
  networking.hostName = hostname;
  networking.computerName = hostname;
  time.timeZone = timeZone;
  system.primaryUser = username;
  system.stateVersion = 6;
  nixpkgs.config.allowUnfree = true;
  security.pam.services.sudo_local.touchIdAuth = true;
  users.users.${username}.home = homeDirectory;
}
