{ config, pkgs, ... }:

{
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
}