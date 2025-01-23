{ config, pkgs, ... }:

{
  imports = [ ./default.nix ];  # Import shared settings first
  
  programs.git = {
    userName = "Ryan Malonzo";
    userEmail = "64932650+ryanmalonzo@users.noreply.github.com";
    signing = {
      key = "/Users/ren/.ssh/git.pub";
      signByDefault = true;
    };
    extraConfig = {
      gpg.format = "ssh";
    };
  };
} 