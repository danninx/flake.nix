{ pkgs, ... }:

let 
  defaultPlugins = with pkgs.vscode-extensions; [
    jdinhlife.gruvbox
    vscodevim.vim
  ];

  makeProfile = plugins:
  {
    extensions = defaultPlugins ++ plugins;
  };

in
  {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = false;

      profiles = {
        default = {
          enableUpdateCheck = false;
          enableExtensionUpdateCheck = false;
          extensions = defaultPlugins ++ [ pkgs.vscode-extensions.jnoortheen.nix-ide ];
        }; 

        "java" = makeProfile [
          pkgs.vscode-extensions.visualstudioexptteam.vscodeintellicode
          pkgs.vscode-extensions.redhat.java
          pkgs.vscode-extensions.vscjava.vscode-java-debug
          pkgs.vscode-extensions.vscjava.vscode-maven
          pkgs.vscode-extensions.vscjava.vscode-java-test
          pkgs.vscode-extensions.vscjava.vscode-java-dependency
          pkgs.vscode-extensions.vscjava.vscode-gradle
        ];

        "python" = makeProfile [
          pkgs.vscode-extensions.ms-python.python
          pkgs.vscode-extensions.ms-python.vscode-pylance
          pkgs.vscode-extensions.ms-python.debugpy
          pkgs.vscode-extensions.ms-toolsai.jupyter
        ];

        "svelte" = makeProfile [
          pkgs.vscode-extensions.svelte.svelte-vscode
        ];

        "c/c++" = makeProfile [
          pkgs.vscode-extensions.ms-vscode.cpptools
        ];
      };
    };
  }
