{ pkgs, ... }:
{
  home.packages = with pkgs; [
    biome
    bun
    fnm
    kubectl
    minikube
  ];

  programs.zsh.initContent = ''
    alias kubectl="minikube kubectl --"

    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
