{
  description = "Ryan's Nix System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    # Helper function to create Darwin configurations
    mkDarwinSystem = { system ? "aarch64-darwin", hostname, username ? "ren" }: 
      nix-darwin.lib.darwinSystem {
        inherit system;
        modules = [
          ./hosts/common.nix
          ./hosts/darwin-common.nix
          (./hosts + "/${hostname}")
          home-manager.darwinModules.home-manager
          {
            users.users.${username}.home = "/Users/${username}";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import (./home + "/${username}");
          }
        ];
      };
  in
  {
    darwinConfigurations = {
      "Ryans-MacBook-Air" = mkDarwinSystem {
        hostname = "Ryans-MacBook-Air";
        username = "ren";
      };
      # Add more Darwin hosts here as needed:
      # "Other-Mac" = mkDarwinSystem {
      #   hostname = "Other-Mac";
      #   username = "otheruser";
      # };
    };
  };
}
