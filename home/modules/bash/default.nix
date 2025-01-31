{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    historyControl = [ "ignoredups" ];
    historyFileSize = 1000000;
    historySize = 10000;

    shellAliases = {
      grep = "grep --color=tty";
      home = "cd ~ && clear";
      la = "ls -alh --color=tty";
      ll = "ls -l --color=tty";
      ls = "ls --color=tty";
      mkcd = "func() { mkdir -p \"$1\" && cd \"$1\"; }; func";
    };
  };
}
