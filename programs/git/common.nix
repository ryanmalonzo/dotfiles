{ config, pkgs, ... }:

{
  imports = [ ./default.nix ];

  programs.git = {
    signing = {
      signByDefault = true;
    };
    settings = {
      gpg.format = "ssh";
      user = {
        email = "64932650+ryanmalonzo@users.noreply.github.com";
        name = "Ryan Malonzo";
      };
    };
  };
}
