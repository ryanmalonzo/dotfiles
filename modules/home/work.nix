{
  pkgs,
  self,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    python313
    vault
    volta
    yarn
  ];

  home.sessionPath = [ "$HOME/.volta/bin" ];

  home.sessionVariables = {
    DEVENV_SKIP_SPX = "true";
    VAULT_ADDR = "https://vault-k8s.tools.spendesk.services";
    VOLTA_HOME = "$HOME/.volta";
  };

  sops.secrets.gh_token = { sopsFile = "${self}/secrets/work.yaml"; };
  sops.secrets.github_token = { sopsFile = "${self}/secrets/work.yaml"; };
  sops.secrets.lokalise_api_token = { sopsFile = "${self}/secrets/work.yaml"; };
  sops.secrets.npm_token = { sopsFile = "${self}/secrets/work.yaml"; };

  programs.zsh.initContent = ''
    alias dbc="node /Users/ryan.malonzo/dev/tableplus-helpers/dist/cli.js"
    alias chr="ANTHROPIC_BASE_URL=http://127.0.0.1:8787 claude"
    alias start-headroom="headroom proxy --port 8787"

    export GH_TOKEN=$(cat ${config.sops.secrets.gh_token.path})
    export GITHUB_TOKEN=$(cat ${config.sops.secrets.github_token.path})
    export LOKALISE_API_TOKEN=$(cat ${config.sops.secrets.lokalise_api_token.path})
    export NPM_TOKEN=$(cat ${config.sops.secrets.npm_token.path})

    spx() {
      case "$1" in
        back|backend)
          yarn w server dev
          ;;
        web|frontend)
          yarn dev
          ;;
        test:unit|tu)
          if [[ -z "$2" ]] || [[ -z "$3" ]]; then
            echo "Usage: spx test:unit <package> <test-file-pattern>"
            return 1
          fi
          local package="$2"
          local test_file="$3"
          if [[ "$package" == "server-fastify" ]]; then
            yarn w server-fastify run-tests --path "$test_file"
          else
            yarn workspace "$package" test --testPathPattern="$test_file"
          fi
          ;;
        test:service|ts)
          if [[ -z "$2" ]]; then
            echo "Usage: spx test:service <test-file-pattern>"
            return 1
          fi
          yarn workspace server test:service --testPathPattern="$2"
          ;;
        migrate)
          yarn migrate-all-dbs
          ;;
        *)
          echo "Usage: spx <command> [args]"
          echo "  back, backend              Run backend server"
          echo "  web, frontend              Run frontend app"
          echo "  test:unit, tu <pkg> <file> Run unit tests"
          echo "  test:service, ts <file>    Run service tests"
          echo "  migrate                    Run all database migrations"
          return 1
          ;;
      esac
    }

    vlogin() {
      local role=''${1:-vault-spx-dev}
      vault login -method=oidc -path=okta role="$role"
    }
  '';
}
