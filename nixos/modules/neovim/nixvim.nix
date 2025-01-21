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
  };
}
