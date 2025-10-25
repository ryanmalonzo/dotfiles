{ pkgs, config, lib, ... }: {
  options = {
    username = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = {
    nixpkgs.hostPlatform = "aarch64-darwin";

    environment.systemPackages = with pkgs; [
      rectangle
    ];

    programs.zsh.enable = true;

    system.primaryUser = config.username;

    # Basic system settings
    system = {
      stateVersion = 5;
      defaults = {
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
          wvous-br-corner = 1; # Disable Quick Note
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

        WindowManager = {
          "EnableStandardClickToShowDesktop" = false;
        };

        CustomUserPreferences = {
          "com.apple.desktopservices" = {
            # Avoid creating .DS_Store files on network or USB volumes
            DSDontWriteNetworkStores = true;
            DSDontWriteUSBStores = true;
          };

          "com.apple.AdLib" = {
            allowApplePersonalizedAdvertising = false;
          };

          "com.apple.SoftwareUpdate" = {
            AutomaticCheckEnabled = true;
            AutomaticDownload = 1;
            CriticalUpdateInstall = 1;
          };
        };
      };

      startup = {
        chime = false;
      };
    };

    power = {
      restartAfterFreeze = true;
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
        "kitty"
        "obsidian"
        "orbstack"
        "raycast"
        "spotify"
        "tailscale-app"
        "visual-studio-code"
        "yaak"
      ];
      brews = [];
      caskArgs = {
        no_quarantine = true;
      };
    };

    home-manager.backupFileExtension = "backup";
  };
}
