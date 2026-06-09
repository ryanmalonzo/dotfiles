{
  self,
  config,
  ...
}:
{
  home.sessionVariables = {
    DEVENV_SKIP_SPX = "true";
  };

  sops.secrets.gh_token = { sopsFile = "${self}/secrets/work.yaml"; };
  sops.secrets.lokalise_api_token = { sopsFile = "${self}/secrets/work.yaml"; };
  sops.secrets.npm_token = { sopsFile = "${self}/secrets/work.yaml"; };

  programs.zsh.initContent = ''
    export GH_TOKEN=$(cat ${config.sops.secrets.gh_token.path})
    export LOKALISE_API_TOKEN=$(cat ${config.sops.secrets.lokalise_api_token.path})
    export NPM_TOKEN=$(cat ${config.sops.secrets.npm_token.path})
  '';
}
