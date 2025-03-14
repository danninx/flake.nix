{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
        jnoortheen.nix-ide
        vscodevim.vim
      ];
    };
  };
}
