{ config, pkgs, ... }:

{
  # Add brew to PATH
  programs.zsh.initExtra = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';

  # Rectangle
  home.file."Library/Application Support/Rectangle/RectangleConfig.json" = {
    source = ../config/rectangle/RectangleConfig.json;
    recursive = true;
  };
}
