{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.dnix.latex;
in
  {
    options = {
      dnix.latex.enable = mkEnableOption "TeXLive package installation and vimtex plugins for neovim";
      dnix.latex.vim-support = mkEnableOption "latex plugins for nixvim";
    };  

    config = mkMerge [
      (mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          texliveFull
          zathura
        ];
      })

      (mkIf (cfg.enable && cfg.vim-support) {
        programs.nixvim = {
          extraConfigLuaPre = ''
                        vim.g.vimtex_compiler_latexmk = {
                        aux_dir = ".build.tex" -- you can set here whatever name you desire
                        }
          '';

          plugins.vimtex = {
            enable = true;
            texlivePackage = pkgs.texlive.combined.scheme-full;
            settings = {
              compiler_method = "pdflatex";
              view_method = "zathura";
            };
          };
        };
      })
    ];
  }
