{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-a";

    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];

    extraConfig = ''
      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      bind c new-window -c "#{pane_current_path}"
      bind = select-layout tiled

      # smart-splits: navigation and resizing, aware of Neovim splits
      bind -n M-h if -F "#{@pane-is-vim}" 'send-keys M-h' 'select-pane -L'
      bind -n M-j if -F "#{@pane-is-vim}" 'send-keys M-j' 'select-pane -D'
      bind -n M-k if -F "#{@pane-is-vim}" 'send-keys M-k' 'select-pane -U'
      bind -n M-l if -F "#{@pane-is-vim}" 'send-keys M-l' 'select-pane -R'
      bind -n M-H if -F "#{@pane-is-vim}" 'send-keys M-H' 'resize-pane -L 3'
      bind -n M-J if -F "#{@pane-is-vim}" 'send-keys M-J' 'resize-pane -D 3'
      bind -n M-K if -F "#{@pane-is-vim}" 'send-keys M-K' 'resize-pane -U 3'
      bind -n M-L if -F "#{@pane-is-vim}" 'send-keys M-L' 'resize-pane -R 3'

      set -g extended-keys on
      set -ga terminal-features '*:extkeys'
      bind -n S-Enter send-keys -H 1b 5b 31 33 3b 32 75

      set -g mouse on

      set -g status-style bg=black,fg=white
      set -g window-status-current-style bg=black,fg=white,bold
      set -g window-status-style bg=black,fg=colour244

      # Start windows and panes at 1
      set -g base-index 1
      setw -g pane-base-index 1
      set -g renumber-windows on
    '';
  };
}
