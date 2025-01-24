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
    };

    keymaps = {
      "<leader>pf" = {
        action = "find_files";
        options.desc = "[p]roject [f]iles";
      };
    };
  };
}
