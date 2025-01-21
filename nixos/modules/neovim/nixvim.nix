{ config, lib, pkgs, nixvim, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";

    clipboard = {
      providers.wl-copy.enable = true;
    };

    opts = {
      clipboard = "unnamedplus";
      shiftwidth = 8;
      tabstop = 8;
    };

    keymaps = [
      {
        mode = ["n"];
        key = "<leader>pv";
        action = "<cmd>Ex<CR>";

      }

      {
        mode = ["n"];
        key = "<leader>n";
        action = "ggvG=<C-o>";
      }

    ];

    extraConfigLuaPre = ''
                        vim.g.vimtex_compiler_latexmk = {
                        aux_dir = ".build.tex" -- you can set here whatever name you desire
                        }
    '';
  };
}
