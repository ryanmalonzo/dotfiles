
#!/bin/zsh

# List of configuration files and directories to sync
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

# Path to the dotfiles directory
DOTFILES_DIR=~/dotfiles

# Function to back up local configs to the dotfiles repository
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

# Function to commit and push changes to the dotfiles repository
update_git_repo() {
    cd "$DOTFILES_DIR" || { echo "Failed to change directory to $DOTFILES_DIR"; exit 1; }
    git add --all
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    git commit -m "Backup: $timestamp"
    git push
}

# Function to pull the latest changes from the dotfiles repository
pull_configs() {
    cd "$DOTFILES_DIR" || { echo "Failed to change directory to $DOTFILES_DIR"; exit 1; }
    git pull --rebase
}

# Function to apply the dotfiles to the system
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

# Main script logic
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

