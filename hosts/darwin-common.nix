{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    rectangle
  ];

  # Enable basic system integration
  programs.zsh.enable = true;
  
  # Basic system settings
  system = {
    stateVersion = 4; # This should match your Darwin version
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
      };
      trackpad = {
        Clicking = 1;
      };
    };
    startup = {
      chime = false;
    };
  };

  time.timeZone = "Europe/Paris";

  # Enable Touch ID for sudo
  security.pam.enableSudoTouchIdAuth = true;

  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # Warning: will remove all the brews and casks that are not managed by Nix
      cleanup = "zap";
      upgrade = true;
    };
    taps = [];
    casks = [
      "ghostty"
    ];
    brews = [];
  };
} 