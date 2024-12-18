{ config, lib, pkgs, nixvim, ... }:

{
    programs.nixvim = {
        enable = true;
        colorschemes.gruvbox.enable = true;
        viAlias = true;
        vimAlias = true;
        globals.mapleader = " ";

        opts = {
            shiftwidth = 8;
            tabstop = 8;
        };

        keymaps = [
            {
                mode = ["n"];
                key = "<leader>pv";
                action = "<cmd>Ex<CR>";
            }
        ];

        extraConfigLuaPre = ''
                        vim.g.vimtex_compiler_latexmk = {
                        aux_dir = ".build.tex" -- you can set here whatever name you desire
                        }
        '';
    };
}
