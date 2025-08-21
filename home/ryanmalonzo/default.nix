{ config, pkgs, ... }:

{
  home.username = "ryanmalonzo";
  home.homeDirectory = "/Users/ryanmalonzo";

  imports = [
    ../common.nix
    ../../programs/git/personal.nix
  ];
}
