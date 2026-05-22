{ username, homeDirectory, ... }:
{
  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "25.11";
}
