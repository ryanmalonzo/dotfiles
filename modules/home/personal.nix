{ pkgs, ... }:
{
  home.packages = with pkgs; [
    biome
    bun
    fnm
    terraform
  ];

  programs.zsh.initContent = ''
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
