{ config, lib, pkgs, nixvim, ... }:

{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<Tab>" = # Lua
          "cmp.mapping(cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
          "<S-Tab>" = # Lua
          "cmp.mapping(cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}), {'i', 's'})";
          "<CR>" = # Lua
          "cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })";
        };
      };
    };

    cmp-buffer.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
  };
}
