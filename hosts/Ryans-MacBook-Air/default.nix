{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";
  
  networking.hostName = "Ryans-MacBook-Air";
  networking.computerName = "Ryans-MacBook-Air";
  
  # Add any other host-specific configurations here
  # For example:
  # - Different system packages
  # - Different system settings
  # - Different service configurations
  environment.systemPackages = with pkgs; [
    spotify
  ];

  homebrew.casks = [
    "nextcloud"
  ];
} 