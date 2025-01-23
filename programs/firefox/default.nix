{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.ren = {
      isDefault = true;
      name = "ren";
      search = {
        default = "DuckDuckGo";
      };
    };
  };
} 