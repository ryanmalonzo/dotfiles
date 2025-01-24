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
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = { self, nixpkgs, home-manager, nur, nixpkgs-firefox-darwin, nix-darwin, mac-app-util, ... }@inputs:
    let
      mkDarwinSystem = { system ? "aarch64-darwin", hostname, username ? "ryanmalonzo" }:
        nix-darwin.lib.darwinSystem {
          inherit system;
          modules = [
            mac-app-util.darwinModules.default
            ./hosts/common.nix
            ./hosts/darwin-common.nix
            (./hosts + "/${hostname}" + "/default.nix") {
              inherit username;
            }
            home-manager.darwinModules.home-manager
            {
              nixpkgs.overlays = [ inputs.nixpkgs-firefox-darwin.overlay inputs.nur.overlays.default ];
              users.users.${username}.home = "/Users/${username}";
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = {
                imports = [
                  (./home + "/${username}")
                  mac-app-util.homeManagerModules.default
                ];
              };
            }
          ];
        };
    in
    {
      darwinConfigurations = {
        "Ryans-MacBook-Air" = mkDarwinSystem {
          hostname = "Ryans-MacBook-Air";
          username = "ryanmalonzo";
        };
        # Add more Darwin hosts here as needed:
        # "Other-Mac" = mkDarwinSystem {
        #   hostname = "Other-Mac";
        #   username = "otheruser";
        # };
      };
    };
}
