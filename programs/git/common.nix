{ config, pkgs, ... }:

{
  imports = [ ./default.nix ];

  programs.git = {
    userName = "Ryan Malonzo";
    userEmail = "64932650+ryanmalonzo@users.noreply.github.com";
    signing = {
      signByDefault = true;
    };
    extraConfig = {
      gpg.format = "ssh";
    };
  };
}