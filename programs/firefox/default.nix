{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
    profiles.ren = {
      isDefault = true;
      name = "ren";
      search = {
        default = "DuckDuckGo";
      };
    };
  };
} 