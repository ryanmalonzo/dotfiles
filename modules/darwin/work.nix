{
  pkgs,
  extraCasks,
  extraBrews,
  dockApps,
  ...
}:
{
  homebrew.casks = extraCasks;
  homebrew.brews = extraBrews;
  system.defaults.dock.persistent-apps = dockApps;
  environment.systemPackages = with pkgs; [
    age
    sops
    yarn
  ];
}
