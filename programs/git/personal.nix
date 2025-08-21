{ config, pkgs, ... }:

{
  imports = [ ./common.nix ];

  programs.git = {
    signing = {
      key = "/Users/ryanmalonzo/.ssh/ryanmalonzo.pub";
    };
  };
}
