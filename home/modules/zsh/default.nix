{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    history = {
      ignoreDups = true;
      save = 1000000;
      share = true;
      size = 1000000;
    };   
    syntaxHighlighting.enable = true;

    initExtra = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
    '';

    shellAliases = {
      grep = "grep --color=tty";
      home = "cd ~ && clear";
      la = "ls -alh --color=tty";
      ll = "ls -l --color=tty";
      ls = "ls --color=tty";
      mkcd = "func() { mkdir -p \"$1\" && cd \"$1\"; }; func";
    };

    oh-my-zsh = {
      enable = false;
      plugins = [
        "git"
        "git-extras"
        "tmux"
      ];
    };
  };
}
