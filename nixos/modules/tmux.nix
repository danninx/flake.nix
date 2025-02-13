{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "a";

    baseIndex = 1;
    escapeTime = 0;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];

    extraConfig = ''
      unbind  C-a
      set     -g  prefix M-a
      bind    M-a send-prefix
      bind    M-a last-window

      set     -g  base-index      1
      setw    -g  pane-base-index 1

      bind    -n  M-h previous-window
      bind    -n  M-l next-window

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
      | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind-key -n 'M-j' if-shell "$is_vim" 'send-keys M-j'  'select-pane -D'
      bind-key -n 'M-k' if-shell "$is_vim" 'send-keys M-k'  'select-pane -U'
      bind-key -T copy-mode-vi 'M-j' select-pane -D
      bind-key -T copy-mode-vi 'M-k' select-pane -U
    '';
  };
}

