#!/bin/zsh

CONFIGS=(
    ~/.config/nvim
    ~/.gitconfig
    ~/.oh-my-zsh/custom/plugins
    ~/.zshrc
    ~/.tmux.conf
    ~/Brewfile
    ~/iterm2.json
)

DOTFILES_DIR=~/dotfiles

sync_configs() {
    for config in $CONFIGS; do
        if [[ -e $config ]]; then
            cp -r $config $DOTFILES_DIR
        else
            echo "Warning: $config does not exist, skipping..."
        fi
    done
}

update_git_repo() {
    cd $DOTFILES_DIR || { echo "Failed to change directory to $DOTFILES_DIR"; exit 1; }
    git add --all
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "Backup: $timestamp"
    git push
}

sync_configs
update_git_repo

