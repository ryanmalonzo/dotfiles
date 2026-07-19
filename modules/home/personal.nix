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
  ];

  programs.zsh.initContent = ''
    eval "$(fnm env --use-on-cd --shell zsh)"
  '';
}
