{ config, lib, pkgs, nixvim, ... }:

{
  options.latex = {
    enable = lib.mkEnableOption "TeXLive package installation and vimtex plugins for neovim";
  };

  config = lib.mkIf config.latex.enable {
    programs.nixvim = {
      extraConfigLuaPre = ''
                        vim.g.vimtex_compiler_latexmk = {
                        aux_dir = ".build.tex" -- you can set here whatever name you desire
                        }
      '';

      plugins.vimtex = {
        enable = false;
        texlivePackage = pkgs.texlive.combined.scheme-full;
        settings = {
          compiler_method = "pdflatex";
          view_method = "zathura";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      texliveFull
    ];
  };
}
