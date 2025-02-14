{ config, lib, pkgs, ... }:

with lib;
let
  latex = config.dnix.latex;
  vim = config.dnix.vim;
in
  {
    options = {
      dnix.vim.enable = mkEnableOption "danninx nixvim configurations";
    };

    config = mkMerge [ 
      (mkIf vim.enable {
        programs.nixvim = {
          enable = true;
          viAlias = true;
          vimAlias = true;
          globals.mapleader = " ";

          clipboard = {
            providers.wl-copy.enable = true;
          };

          opts = {
            clipboard = "unnamedplus";
            shiftwidth = 4;
            tabstop = 4;
          };
        };
      })

      (mkIf (vim.enable && latex.enable) {
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

          plugins.lsp.servers.texlab.enable = true;
        };
      })
    ];
  }
