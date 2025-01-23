{ config, lib, ... }:

with lib;
let
  cfg = config.dnix.vim;
in

  {
    options = {
      dnix.vim.enable = mkEnableOption "danninx nixvim configurations";
    };

    config = mkIf cfg.enable {
      programs.nixvim = {
        enable = true;
        # colorschemes.gruvbox.enable = true; // doing this with stylix now I believe
        viAlias = true;
        vimAlias = true;
        globals.mapleader = " ";

        clipboard = {
          providers.wl-copy.enable = true;
        };

        opts = {
          clipboard = "unnamedplus";
          relativenumber = true;
          shiftwidth = 8;
          tabstop = 8;
        };
      };
    };
  }
