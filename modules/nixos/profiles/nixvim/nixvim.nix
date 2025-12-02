{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    modules.nixvim.enable = lib.mkEnableOption "nixvim configurations";
  };

  config = (
    lib.mkIf config.modules.nixvim.enable {
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
          number = true;
        };
        extraConfigLuaPre = ''
          vim.g.vimtex_compiler_latexmk = {
          aux_dir = ".build.tex"
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
    }
  );
}
