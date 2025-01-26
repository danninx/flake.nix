{ config, lib, ... }:

with lib;
let
  cfg = config.dnix.vim;
in

  {
    options = {
      dnix.vim.enable = mkEnableOption "danninx nixvim configurations";
      dnix.vim.customColors = mkEnableOption "nixvim coloring (leave this false if using stylix)";
    };

    config = mkIf cfg.enable {
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

        colorschemes.kanagawa = mkIf cfg.customColors {
          enable = true;
          settings = {
            compile = false;
            undercurl = true;
            commentStyle.italic = true;
            functionStyle = { };
            transparent = true;
            dimInactive = false;
            terminalColors = true;
            colors = {
              theme = {
                wave.ui.float.bg = "none";
                dragon.syn.parameter = "yellow";
                all.ui.bg_gutter = "none";
              };
              palette = {
                sumiInk0 = "#000000";
                fujiWhite = "#FFFFFF";
              };
            };
            overrides = "function(colors) return {} end";
            theme = "wave";
          };
        };
      };
    };
  }
