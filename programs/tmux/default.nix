{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "C-a";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"
        '';
      }
    ];

    extraConfig = ''
      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

      bind c new-window -c "#{pane_current_path}"
      bind = select-layout tiled

      # smart-splits: navigation and resizing, aware of Neovim splits
      bind -n C-h if -F "#{@pane-is-vim}" 'send-keys C-h' 'select-pane -L'
      bind -n C-j if -F "#{@pane-is-vim}" 'send-keys C-j' 'select-pane -D'
      bind -n C-k if -F "#{@pane-is-vim}" 'send-keys C-k' 'select-pane -U'
      bind -n C-l if -F "#{@pane-is-vim}" 'send-keys C-l' 'select-pane -R'
      bind -n M-h if -F "#{@pane-is-vim}" 'send-keys M-h' 'resize-pane -L 3'
      bind -n M-j if -F "#{@pane-is-vim}" 'send-keys M-j' 'resize-pane -D 3'
      bind -n M-k if -F "#{@pane-is-vim}" 'send-keys M-k' 'resize-pane -U 3'
      bind -n M-l if -F "#{@pane-is-vim}" 'send-keys M-l' 'resize-pane -R 3'

      set -g extended-keys on
      set -ga terminal-features '*:extkeys'
      bind -n S-Enter send-keys -H 1b 5b 31 33 3b 32 75

      set -g mouse on

      # Start windows and panes at 1
      set -g base-index 1
      setw -g pane-base-index 1
      set -g renumber-windows on
    '';
  };
}
