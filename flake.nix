{
  description = "Ryan's Nix System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }@inputs:
    let
      # Profile configurations - add new profiles here
      profiles = {
        personal = {
          username = "ryanmalonzo";
          homeDirectory = "/Users/ryanmalonzo";
          hostConfigPath = ./hosts/personal.nix;
          homeConfigPath = ./home/personal.nix;
        };
      };

      mkDarwinSystem =
        {
          system ? "aarch64-darwin",
          profile,
        }:
        let
          profileConfig = profiles.${profile};
        in
        nix-darwin.lib.darwinSystem {
          inherit system;
          modules = [
            ./hosts/common.nix
            profileConfig.hostConfigPath
            home-manager.darwinModules.home-manager
            {
              # Workaround: fish 4.2.1 has an invalid code signature on darwin,
              # causing the direnv test suite to be killed. Disable tests until fixed.
              # https://github.com/NixOS/nixpkgs/issues/507531
              nixpkgs.overlays = [
                (_final: prev: {
                  direnv = prev.direnv.overrideAttrs (_: { doCheck = false; });
                })
              ];
            }
            {
              username = profileConfig.username;
              users.users.${profileConfig.username}.home = profileConfig.homeDirectory;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.${profileConfig.username} = {
                imports = [ profileConfig.homeConfigPath ];
              };
            }
          ];
        };
    in
    {
      darwinConfigurations = builtins.mapAttrs (
        profileName: _:
        mkDarwinSystem {
          profile = profileName;
        }
      ) profiles;
    };
}
