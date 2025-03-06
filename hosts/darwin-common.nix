{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    rectangle
  ];

  # Enable basic system integration
  programs.zsh.enable = true;

  # Basic system settings
  system = {
    stateVersion = 5; # This should match your Darwin version
    defaults = {
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        "com.apple.mouse.tapBehavior" = 1;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        mineffect = "scale";
        mru-spaces = false;
        tilesize = 50;
      };

      finder = {
        AppleShowAllExtensions = true;
        NewWindowTarget = "Home";
        ShowPathbar = true;
        _FXShowPosixPathInTitle = true;
      };

      loginwindow = {
        GuestEnabled = false;
      };

      screencapture = {
        location = "~/Pictures/Screenshots";
        target = "clipboard";
        type = "png";
      };

      trackpad = {
        Clicking = true;
      };
    };

    startup = {
      chime = false;
    };
  };

  time.timeZone = "Europe/Paris";

  # Enable Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # Warning: will uninstall all formulae and casks that are not listed below
      cleanup = "zap";
      upgrade = true;
    };
    taps = [];
    casks = [
      "ghostty"
    ];
    brews = [];
    caskArgs = {
      no_quarantine = true;
    };
  };

  home-manager.backupFileExtension = "backup";
}
