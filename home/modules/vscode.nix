{ lib, pkgs, ... }:

let 
  vscode-wrapped = (pkgs.vscode.fhs.overrideAttrs (old: rec {
    commandLineArgs = "--user-angle=vulkan";
  }));

  defaultPlugins = with pkgs.vscode-extensions; [
    vscodevim.vim
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons
  ];

  defaultSettings = {
    "workbench.colorTheme" = "Catppuccin Mocha";
    "workbench.iconTheme" = "Catppuccin Mocha";
    "editor.fontFamily" = "Fira Code";
    "editor.fontLigatures" = true;
    "editor.minimap.enabled" = false;
    "workbench.sideBar.location"= "right";
    };


    makeProfile = plugins: settings:
    {
      extensions = defaultPlugins ++ plugins;
      userSettings = settings;
    };

in
  {
    programs.vscode = {
      enable = true;
      package = vscode-wrapped;
      mutableExtensionsDir = true;
    };
  }
  # {
  #   programs.vscode = {
  #     enable = true;
  #     package = pkgs.vscode.fhs;
  #     mutableExtensionsDir = true;

  #     profiles = {
  #       default = {
  #         enableUpdateCheck = false;
  #         enableExtensionUpdateCheck = false;
  #         extensions = defaultPlugins ++ [ pkgs.vscode-extensions.jnoortheen.nix-ide ];
  #         userSettings = defaultSettings;
  #       }; 

  #       "java" = makeProfile [
  #         pkgs.vscode-extensions.visualstudioexptteam.vscodeintellicode
  #         pkgs.vscode-extensions.redhat.java
  #         pkgs.vscode-extensions.vscjava.vscode-java-debug
  #         pkgs.vscode-extensions.vscjava.vscode-maven
  #         pkgs.vscode-extensions.vscjava.vscode-java-test
  #         pkgs.vscode-extensions.vscjava.vscode-java-dependency
  #         pkgs.vscode-extensions.vscjava.vscode-gradle
  #         pkgs.vscode-extensions.vscjava.vscode-java-pack
  #       ] {};

  #       "python" = makeProfile [
  #         pkgs.vscode-extensions.ms-python.python
  #         pkgs.vscode-extensions.ms-python.vscode-pylance
  #         pkgs.vscode-extensions.ms-python.debugpy
  #         pkgs.vscode-extensions.ms-toolsai.jupyter
  #       ] {};

  #       "svelte" = makeProfile [
  #         pkgs.vscode-extensions.svelte.svelte-vscode
  #       ] {};

  #       "c/c++" = makeProfile [
  #         pkgs.vscode-extensions.ms-vscode.cpptools
  #       ] {};

  #       "go" = makeProfile [
  #         pkgs.vscode-extensions.golang.go
  #       ] {};

  #       "web" = makeProfile [
  #         pkgs.vscode-extensions.dbaeumer.vscode-eslint
  #         pkgs.vscode-extensions.eamodio.gitlens
  #         pkgs.vscode-extensions.esbenp.prettier-vscode
  #       ] {};
  #     };
  #   };
  # }
