{ pkgs, ... }:
{
  programs.ssh.settings."chaldea" = {
    HostName = "192.168.1.35";
    User = "ren";
    Port = 2222;
    IdentityFile = "~/.ssh/chaldea";
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
