{ lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;

      format = lib.concatStrings [
        "$directory"
        "$git_branch"
        "($bun )($golang )($java )($python )"
        "$character"
      ];
      
      right_format = "$direnv $nix_shell $time $battery";
  
      battery = {
        format = "[\\($percentage\\)]($style)";
        display = [
          {
            threshold = 10;
            style = "bold red";
          }
          {
            threshold = 30;
            style = "bold yellow";
          }
          {
            threshold = 100;
            style = "bold green";
          }
        ];
      };

      bun = {
        format = "[\\(bun( $version)\\)]($style)";
        style = "bold bright-yellow";
      };

      character = {
        success_symbol = "[➜](bold green)";
      };

      directory = {
        home_symbol = "~";
        style = "bold bright-blue";
      };

      fill = {
        symbol = " ";
      };

      git_status = {
        untracked = "";
      };

      golang = {
        format = "[\\(golang( $version)\\)]($style)";
        style = "bold blue";
      };

      java = {
        format = "[\\(java( \${version})\\)]($style)";
        style = "bold bright-red";
      };

      nix_shell = {
        format = "[\\(nix-shell\\)]($style)";
        impure_msg = "";
        style = "bold bright-blue";
        symbol = "";
      };

      os = {
        disabled = false;
        style = "bg:red fg:crust";
      };

      python = {
        format = "[\\(python [\${pyenv_prefix}](bold bright-blue)(\${version})( - $virtualenv)\\)]($style)";
        style = "bold bright-yellow";
      };

      rust = {
        format = "[\\(rust( $version)\\)]($style)";
      };

      time = {
        disabled = false;
        format = "[$time]($style)";
      };
    };
  };
}
