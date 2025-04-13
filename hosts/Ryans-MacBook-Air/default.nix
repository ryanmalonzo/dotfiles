{ pkgs, config, lib, ... }: {
  options = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "The primary user's username";
    };
  };

  config = {
    nixpkgs.hostPlatform = "aarch64-darwin";

    networking.hostName = "Ryans-MacBook-Air";
    networking.computerName = "Ryans-MacBook-Air";

    # Add any other host-specific configurations here
    # For example:
    # - Different system packages
    # - Different system settings
    # - Different service configurations
    system.defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark"; # Dark mode
        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
      };
      dock = {
        show-recents = false;
        wvous-br-corner = 1; # Disable Quick Note

        # Pinned apps in dock
        persistent-apps = [
          "/Applications/Brave Browser.app"
          "/Applications/Discord.app"
          "/Applications/Nix Apps/Spotify.app"
          "/Applications/Ghostty.app"
          "/Applications/Visual Studio Code.app"
          "/Applications/ProtonVPN.app"
          "/System/Applications/System Settings.app"
        ];
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

    power = {
      restartAfterFreeze = true;
    };

    environment.systemPackages = with pkgs; [
      go
      spotify
    ];

    homebrew.casks = [
      "brave-browser"
      "discord"
      "obsidian"
      "orbstack"
      "protonvpn"
      "raycast"
      "tailscale"
      "visual-studio-code"
    ];
  };
}
