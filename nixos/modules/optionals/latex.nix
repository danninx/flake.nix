{ config, lib, pkgs, ... }:

with lib;
let
  latex = config.dnix.latex;
in
{
  options = {
    dnix.latex.enable = mkEnableOption "texlive-full and zathura installation for latex writing";
  };  

  config = mkIf latex.enable {
    environment.systemPackages = with pkgs; [
      texliveFull
      zathura
    ];
  };
}
