{ config, lib, pkgs, ... }:

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

    initExtraFirst = ''
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';

    initExtra = ''
      source ~/.p10k.zsh
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

    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      } 
    ];
  };
}
