export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git git-auto-fetch z direnv)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Change default `ls` colors to look good in light mode
export LSCOLORS=exfxcxdxbxegedabagacad

# Environment variables
export PATH=$HOME/.local/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export SAM_CLI_TELEMETRY=0

# Aliases
alias brewupdate="brew update && brew upgrade"
alias dcb="docker compose build"
alias dcd="docker compose down"
alias dce="docker compose exec"
alias dcl="docker compose logs"
alias dcp="docker compose ps"
alias dcu="docker compose up -d"
alias dots="~/dotfiles/sync.sh"
alias srczsh="source ~/.zshrc"
alias vim=nvim
alias vimzsh="nvim ~/.zshrc"
alias updatereqs="pipreqs --encoding utf-8 --force ."

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# python / pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init - | sed s/precmd/precwd/g)"

# oh-my-zsh plugins
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Launch tmux if installed
if [ "$TMUX" = "" ]; then tmux; fi
