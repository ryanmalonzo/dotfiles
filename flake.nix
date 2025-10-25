{
  description = "Ryan's Nix System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... }@inputs:
    let
      # Profile configurations - add new profiles here
      profiles = {
        personal = {
          username = "ryanmalonzo";
          homeDirectory = "/Users/ryanmalonzo";
          hostConfigPath = ./hosts/personal.nix;
          homeConfigPath = ./home/personal.nix;
        };
        beta = {
          username = "ryanmalonzo";
          homeDirectory = "/Users/ryanmalonzo";
          hostConfigPath = ./hosts/beta.nix;
          homeConfigPath = ./home/beta.nix;
        };
        work = {
          username = "ryan.malonzo";
          homeDirectory = "/Users/ryan.malonzo";
          hostConfigPath = ./hosts/work.nix;
          homeConfigPath = ./home/work.nix;
        };
      };

      mkDarwinSystem = { system ? "aarch64-darwin", profile }:
        let
          profileConfig = profiles.${profile};
        in
        nix-darwin.lib.darwinSystem {
          inherit system;
          modules = [
            ./hosts/common.nix
            ./hosts/darwin-common.nix
            profileConfig.hostConfigPath
            home-manager.darwinModules.home-manager
            {
              username = profileConfig.username;
              users.users.${profileConfig.username}.home = profileConfig.homeDirectory;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${profileConfig.username} = {
                imports = [ profileConfig.homeConfigPath ];
              };
            }
          ];
        };
    in
    {
      darwinConfigurations = builtins.mapAttrs (profileName: _: mkDarwinSystem {
        profile = profileName;
      }) profiles;
    };
}
