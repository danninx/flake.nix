{ config, lib, ... }:

with lib;
{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      lazyLoad.settings.before.__raw = ''
        function()
          require("lz.n").trigger_load("mini.nvim")
        end
      '';

      settings = {
        useDefaultKeymaps = true;
        deleteToTrash = true;
        default_file_explorer = true;
        skip_confirm_for_simple_edits = true;

        float = {
          padding = 2;
          maxWidth = 0;
          maxHeight = 0;
          border = "shadow";
        };

        keymaps = {
          "q" = "actions.close";
        };

        view_options = {
          show_hidden = true;
        };
      };
    };

    keymaps = [
      (mkIf config.programs.nixvim.plugins.oil.enable {
        mode = [ "n" ];
        key = "<leader>pv";
        action = "<cmd>Oil<CR>";
        options = {
          desc = "Open oil float view";
          silent = true;
        };
      })
    ];
  };
}
