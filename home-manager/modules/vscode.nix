{ config, pkgs, ... }:

{
   programs.vscode = {
      enable = true;

      extensions = with pkgs.vscode-extensions; [
         jdinhlife.gruvbox
         jnoortheen.nix-ide
         vscodevim.vim
      ];

      userSettings = {
         "editor.fontSize" = 14;
         "workbench.colorTheme" = "Gruvbox Dark Soft";
      };
   };
}
