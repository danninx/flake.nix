{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      undo.enable = true;
      ui-select = {
        settings = {
          specific_opts = {
            codeactions = true;
          };
        };
      };
      live-grep-args.enable = true;
    };

    keymaps = {
      "<leader>pf" = {
        action = "find_files";
        options.desc = "[p]roject [f]iles";
      };
      "<leader>pg" = {
        action = "live_grep";
        options.desc = "[p]roject [g]rep";
      };
    };
  };
}
