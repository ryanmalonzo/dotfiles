{ ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "GeistMono Nerd Font Mono";
      size = 15.0;
    };
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      disable_ligatures = "always";
      font_features = "GeistMonoNFM-Regular -calt -liga -dlig";
      cursor_shape = "block";
      copy_on_select = "clipboard";
      enable_audio_bell = "no";
      window_padding_width = "20.0";
      shell_integration = "no-cursor";
      macos_option_as_alt = "left";
    };
    keybindings = {
      "shift+enter" = "send_text all \\x1b[13;2u";
    };
    extraConfig = ''
      include dark-theme.auto.conf
      include light-theme.auto.conf
    '';
  };

  xdg.configFile."kitty/dark-theme.auto.conf".source = ../../../config/kitty/dark-theme.auto.conf;
  xdg.configFile."kitty/light-theme.auto.conf".source = ../../../config/kitty/light-theme.auto.conf;
}
