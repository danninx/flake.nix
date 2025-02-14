{ config, lib, pkgs, ... }:

with lib;
let
  latex = config.dnix.latex;
in
{
  options = {
    dnix.latex.enable = mkEnableOption "TeXLive package installation and vimtex plugins for neovim";
  };  

  config = mkIf latex.enable {
    environment.systemPackages = with pkgs; [
      texliveFull
      zathura
    ];
  };
}
