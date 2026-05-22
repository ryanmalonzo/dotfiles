{
  description = "ryanmalonzo's nix-darwin dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      sops-nix,
      ...
    }@inputs:
    let
      mkSystem =
        {
          profile,
          darwinModules ? [ ],
          homeModules ? [ ],
          system ? "aarch64-darwin",
        }:
        nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = profile // {
            inherit inputs self;
          };
          modules = [
            {
              nixpkgs.overlays = [
                (_: prev: {
                  direnv = prev.direnv.overrideAttrs (_: {
                    doCheck = false;
                  });
                })
              ];
            }
            ./modules/darwin/default.nix
          ]
          ++ darwinModules
          ++ [
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = profile // {
                inherit inputs self;
              };
              home-manager.users.${profile.username}.imports = [
                ./modules/home/default.nix
                sops-nix.homeManagerModules.sops
              ]
              ++ homeModules;
            }
          ];
        };
    in
    {
      darwinConfigurations.personal = mkSystem {
        profile = import ./profiles/personal.nix;
        darwinModules = [ ./modules/darwin/personal.nix ];
      };
    };
}
