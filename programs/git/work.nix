{ config, pkgs, ... }:

{
  imports = [ ./common.nix ];

  programs.git = {
    signing = {
      key = "/Users/ryan.malonzo/.ssh/git.pub";
    };
  };
}
