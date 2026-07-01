{ pkgs, ... }:
{
  home.packages = with pkgs; [
    biome
    bun
    fnm
  ];

  programs.zsh.initContent = ''
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
