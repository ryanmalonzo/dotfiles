{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.blex-mono
  ];

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        indent_size = 2;
        indent_style = "space";
        end_of_line = "lf";
        insert_final_newline = true;
        trim_trailing_whitespace = true;
      };
      
      "*.{md,mdx,diff}" = {
        trim_trailing_whitespace = false;
      };
      
      "*.py" = {
        indent_size = 4;
      };
      
      "*.{cmd,bat,ps1}" = {
        end_of_line = "crlf";
      };
    };
  };

  ## Unmanaged config files
  
  # eza
  home.file.".config/eza/theme.yml" = {
    source = ../config/eza/theme.yml;
    recursive = true;
  };

  # Ghostty
  home.file.".config/ghostty/config" = {
    source = ../config/ghostty/config;
    recursive = true;
  };
}
