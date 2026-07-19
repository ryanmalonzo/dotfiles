{ pkgs, ... }:
{
  programs.ssh.matchBlocks."chaldea" = {
    hostname = "192.168.1.35";
    user = "ren";
    port = 2222;
    identityFile = "~/.ssh/chaldea";
  };

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
