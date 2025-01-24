{ ... }:

{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      sources = ["filesystem" "buffers" "git_status" "document_symbols"];
      filesystem = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
        filteredItems = {
          visible = true;
          hideDotfiles = false;
          hideGitignored = true;
          neverShow = [".git"];
        };
      };
    };

    keymaps = [
      {
        mode = ["n"];
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options = {desc = "Open/Close Neotree";};
      }
    ];
  };
}
