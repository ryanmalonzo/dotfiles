#!/bin/zsh

CONFIGS=(
    ~/.config/nvim
    ~/.editorconfig
    ~/.gitconfig
    ~/.oh-my-zsh/custom/plugins
    ~/.tmux.conf
    ~/.zshrc
    ~/Brewfile
    ~/iterm2.json
    ~/raycast.rayconfig
    ~/.wezterm.lua
)

DOTFILES_DIR=~/dotfiles

sync_configs() {
    for config in "${CONFIGS[@]}"; do
        if [[ -e $config ]]; then
            cp -r "$config" "$DOTFILES_DIR"
            echo "Synced $config to $DOTFILES_DIR"
        else
            echo "Warning: $config does not exist, skipping..."
        fi
    done
}

update_git_repo() {
    cd "$DOTFILES_DIR" || { echo "Failed to change directory to $DOTFILES_DIR"; exit 1; }
    git add --all
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "Backup: $timestamp"
    git push
}

pull_configs() {
    cd "$DOTFILES_DIR" || { echo "Failed to change directory to $DOTFILES_DIR"; exit 1; }
    git pull --rebase
}

apply_configs() {
    for config in "${CONFIGS[@]}"; do
        config_basename=$(basename "$config")
        source_path="$DOTFILES_DIR/$config_basename"
        target_path="$config"

        if [[ -e $source_path ]]; then
            cp -r "$source_path" "$target_path"
            echo "Applied $source_path to $target_path"
        else
            echo "Warning: $source_path does not exist in $DOTFILES_DIR, skipping..."
        fi
    done
}

case "$1" in
    backup)
        sync_configs
        update_git_repo
        ;;
    pull)
        pull_configs
        ;;
    apply)
        apply_configs
        ;;
    *)
        echo "Usage: $0 {backup|pull|apply}"
        ;;
esac

