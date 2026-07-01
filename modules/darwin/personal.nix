{
  extraCasks,
  extraBrews,
  brewCleanup,
  extraMasApps,
  dockApps,
  ...
}:
{
  homebrew.casks = extraCasks;
  homebrew.brews = extraBrews;
  homebrew.onActivation.cleanup = brewCleanup;
  homebrew.onActivation.extraFlags = [ "--force" ]; # brew bundle --cleanup now needs --force
  homebrew.masApps = extraMasApps;
  system.defaults.dock.persistent-apps = dockApps;
}
