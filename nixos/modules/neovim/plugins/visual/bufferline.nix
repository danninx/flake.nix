{ config, lib, ... }:

{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;

      settings = {
        options = {
          separator_style = "thin";
        };

        highlights = {
          fill = {
            fg = "none";
            bg = "none";
          };

          background = {
            fg = "none";
            bg = "none";
          };
        };
      };
    };

    keymaps = lib.mkIf config.programs.nixvim.plugins.bufferline.enable [
      {
        mode = "n";
        key = "t";
        action = "<cmd>BufferLineCycleNext<cr>";
        options = {
          desc = "Next buffer";
        };
      }
      {
        mode = "n";
        key = "<S-t>";
        action = "<cmd>BufferLineCyclePrev<cr>";
        options = {
          desc = "Previous buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>do";
        action = "<cmd>BufferLineCloseOthers<cr>";
        options = {
          desc = "[D]ump [o]ther buffers";
        };
      }
    ];
  };
}
