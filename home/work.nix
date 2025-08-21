{ config, pkgs, ... }:

{
  home.username = "ryan.malonzo";
  home.homeDirectory = "/Users/ryan.malonzo";

  imports = [
    ./common.nix
    ../programs/git/work.nix
  ];
}