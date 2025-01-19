{ config, lib, pkgs, nixvim, ... }:

{
  programs.nixvim.plugins.vimtex = {
    enable = false;
    texlivePackage = pkgs.texlive.combined.scheme-full;
    settings = {
      compiler_method = "pdflatex";
      view_method = "zathura";
    };
  };
}
