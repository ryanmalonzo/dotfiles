{
  description = "Ryan's Nix System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    nixpkgs-firefox-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-firefox-darwin, nix-darwin, ... }@inputs:
    let
      mkDarwinSystem = { system ? "aarch64-darwin", hostname, username ? "ren" }: 
        nix-darwin.lib.darwinSystem {
          inherit system;
          modules = [
            ./hosts/common.nix
            ./hosts/darwin-common.nix
            (./hosts + "/${hostname}")
            home-manager.darwinModules.home-manager
            {
              nixpkgs.overlays = [ inputs.nixpkgs-firefox-darwin.overlay ];
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
