{
  description = "ryanmalonzo's nix-darwin dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
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
      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-tree;

      darwinConfigurations.personal = mkSystem {
        profile = import ./profiles/personal.nix;
        darwinModules = [ ./modules/darwin/personal.nix ];
        homeModules = [ ./modules/home/personal.nix ];
      };

      darwinConfigurations.work = mkSystem {
        profile = import ./profiles/work.nix;
        darwinModules = [ ./modules/darwin/work.nix ];
        homeModules = [ ./modules/home/work.nix ];
      };
    };
}
