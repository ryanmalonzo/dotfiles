{
  pkgs,
  extraCasks,
  extraBrews,
  brewCleanup,
  dockApps,
  ...
}:
{
  homebrew.casks = extraCasks;
  homebrew.brews = extraBrews;
  homebrew.onActivation.cleanup = brewCleanup;
  homebrew.masApps = { };
  system.defaults.dock.persistent-apps = dockApps;
  environment.systemPackages = with pkgs; [
    age
    biome
    bun
    sops
    terraform
  ];
}
