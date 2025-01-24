{ config, lib, ... }:

with lib;
{
  programs.nixvim.keymaps = [
    (mkIf (!config.programs.nixvim.plugins.oil.enable) {
      mode = ["n"];
      key = "<leader>pv";
      action = "<cmd>Ex<CR>";
      options.desc = "Enter file explorer";
    })

    # does this one even work correctly?
    {
      mode = ["n"];
      key = "<leader>n";
      action = "gg=G<C-o>";
      options.desc = "Quick indent file";
    }

    {
      mode = ["n"];
      key = "<leader>c";
      action = "<cmd>%y";
      options.desc = "Copy file";
    }
  ];
}
