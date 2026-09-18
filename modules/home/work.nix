{
  pkgs,
  self,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    ngrok
    vault
    volta
    yarn
  ];

  home.sessionPath = [ "$HOME/.volta/bin" ];

  home.sessionVariables = {
    DD_SITE = "datadoghq.eu";
    VAULT_ADDR = "https://vault-k8s.tools.spendesk.services";
    VOLTA_HOME = "$HOME/.volta";
  };

  sops.secrets.gh_token = { sopsFile = "${self}/secrets/work.yaml"; };
  sops.secrets.github_token = { sopsFile = "${self}/secrets/work.yaml"; };
  sops.secrets.lokalise_api_token = { sopsFile = "${self}/secrets/work.yaml"; };
  sops.secrets.npm_token = { sopsFile = "${self}/secrets/work.yaml"; };

  programs.zsh.initContent = ''
    export GH_TOKEN=$(cat ${config.sops.secrets.gh_token.path})
    export GITHUB_TOKEN=$(cat ${config.sops.secrets.github_token.path})
    export HOMEBREW_GITHUB_API_TOKEN=$(cat ${config.sops.secrets.github_token.path})
    export LOKALISE_API_TOKEN=$(cat ${config.sops.secrets.lokalise_api_token.path})
    export NPM_TOKEN=$(cat ${config.sops.secrets.npm_token.path})

    dev() {
      case "$PWD" in
        "$HOME"/dev/spendesk*)
          yarn w server dev
          ;;
        "$HOME"/dev/app-desktop*)
          yarn dev
          ;;
        *)
          return 1
          ;;
      esac
    }

    forest() {
      local model
      case "$1" in
        company)
          model="Company"
          ;;
        user)
          model="User"
          ;;
        card)
          model="Card"
          ;;
        *)
          echo "Usage: forest <company|user|card> <id>"
          return 1
          ;;
      esac
      if [[ -z "$2" ]]; then
        echo "Usage: forest $1 <id>"
        return 1
      fi
      open "https://app.forestadmin.com/Spendesk/Production/Spendesk%20(Read)/data/$model/index/record/$model/$2/summary"
    }
  '';
}
