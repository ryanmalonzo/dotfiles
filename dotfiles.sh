
#!/bin/zsh

CONFIGS=(
    ~/.config/nvim
    ~/.config/starship.toml
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
            config_basename=$(basename "$config")
            destination="$DOTFILES_DIR/$config_basename"

            if [[ -d $config ]]; then
                # Remove local copy before copying the new one
                rm -rf "$destination"
                mkdir -p "$destination"
                cp -r "$config/"* "$destination"
            else
                # For files, just replace the existing file
                rm -f "$destination"
                cp "$config" "$destination"
            fi
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
            if [[ -d $source_path ]]; then
                # Ensure target is a directory and copy contents
                mkdir -p "$target_path"
                cp -r "$source_path/"* "$target_path"
            else
                # Directly copy files
                cp "$source_path" "$target_path"
            fi
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

