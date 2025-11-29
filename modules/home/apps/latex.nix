{ config, lib, pkgs, ... }:

{
  options = {
    dots.latex.enable = lib.mkEnableOption "texlive and zathura installation";
  };

  config = (lib.mkIf config.dots.latex.enable {
    programs.texlive = {
      enable = true;
      pkg = pkgs.texliveFull;
    };
  });
}

