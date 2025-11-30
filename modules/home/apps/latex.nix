{ config, lib, pkgs, ... }:

{
  options = {
    modules.latex.enable = lib.mkEnableOption "texlive and zathura installation";
  };

  config = (lib.mkIf config.modules.latex.enable {
    programs.texlive = {
      enable = true;
      pkg = pkgs.texliveFull;
    };
  });
}

