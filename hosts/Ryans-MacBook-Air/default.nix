{ pkgs, ... }: {
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
    };
  };

  power = {
    restartAfterFreeze = true;
  };
  
  environment.systemPackages = with pkgs; [
    discord
    spotify
  ];

  homebrew.casks = [
    "nextcloud"
  ];
} 