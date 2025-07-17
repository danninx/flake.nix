{ config, lib, pkgs, ... }:

with lib; let
  cfg = config.dnix.tmux;
in
  {
    options = {
      dnix.tmux.enable = mkEnableOption "install tmux with some pre-configuration";
    };

    config = mkIf cfg.enable {
      programs.tmux = {
        enable = true;
        shortcut = "a";

        baseIndex = 1;
        escapeTime = 0;

        plugins = with pkgs.tmuxPlugins; [
          continuum
          resurrect
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
          set-option -g mouse on

          bind    -n  M-h previous-window
          bind    -n  M-l next-window

          is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
          bind-key -n 'M-j' if-shell "$is_vim" 'send-keys M-j'  'select-pane -D'
          bind-key -n 'M-k' if-shell "$is_vim" 'send-keys M-k'  'select-pane -U'
          bind-key -T copy-mode-vi 'M-j' select-pane -D
          bind-key -T copy-mode-vi 'M-k' select-pane -U

          # Fixes neovim colors in tmux-alacritty (it uses "screen" term by default).
          set -g default-terminal "alacritty"
          set-option -ga terminal-overrides ",alacritty:Tc"

          # Resurrection settings; should revive neovim sessions
          resurrect_dir="$HOME/.tmux/resurrect"
          set -g @resurrect-dir $resurrect_dir
          set -g @resurrect-hook-post-save-all "sed -i 's/--cmd lua.*--cmd set packpath/--cmd \"lua/g; s/--cmd set rtp.*\$/\"/' $resurrect_dir/last"
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-processes '"~nvim"'
        '';
      };
    };
  }

