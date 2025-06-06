{ config, pkgs, ... }:

{
  imports = [ ./default.nix ];

  programs.git = {
    userName = "Ryan Malonzo";
    userEmail = "64932650+ryanmalonzo@users.noreply.github.com";
    signing = {
      key = "/Users/ryan.malonzo/.ssh/git.pub";
      signByDefault = true;
    };
    extraConfig = {
      gpg.format = "ssh";
    };
  };
}
