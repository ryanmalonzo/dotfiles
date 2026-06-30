{
  pkgs,
  username,
  homeDirectory,
  hostname,
  timeZone,
  ...
}:
{
  nix.enable = false;
  system.primaryUser = username;
  system.stateVersion = 6;
  nixpkgs.config.allowUnfree = true;
  security.pam.services.sudo_local.touchIdAuth = true;
  users.users.${username}.home = homeDirectory;

  networking.hostName = hostname;
  networking.computerName = hostname;
  time.timeZone = timeZone;

  programs.zsh.enable = true;

  system.defaults = {
    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      "com.apple.mouse.tapBehavior" = 1;
      AppleInterfaceStyle = "Dark";
      NSAutomaticWindowAnimationsEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
    };

    dock = {
      autohide = true;
      autohide-delay = 0.0;
      expose-group-apps = true;
      mineffect = "scale";
      mru-spaces = false;
      tilesize = 50;
      show-recents = false;
      wvous-br-corner = 1;
    };

    finder = {
      AppleShowAllExtensions = true;
      NewWindowTarget = "Home";
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
    };

    loginwindow.GuestEnabled = false;

    screencapture = {
      target = "clipboard";
      type = "png";
    };

    trackpad.Clicking = true;

    WindowManager."EnableStandardClickToShowDesktop" = false;

    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
      "com.apple.AdLib".allowApplePersonalizedAdvertising = false;
      "com.apple.SoftwareUpdate" = {
        AutomaticCheckEnabled = true;
        AutomaticDownload = 1;
        CriticalUpdateInstall = 1;
      };
    };
  };

  system.startup.chime = false;
  power.restartAfterFreeze = true;

  fonts.packages = [ pkgs.nerd-fonts.geist-mono ];

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    brews = [ "mole" "pipx" ];
    casks = [
      "kitty"
      "orbstack"
      "raycast"
      "tailscale-app"
      "spotify"
      "rectangle"
      "yaak"
    ];
  };
}
