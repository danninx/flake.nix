{
  imports = [
    ./lang/cmp.nix
    ./lang/treesitter.nix

    ./nav/oil.nix
    ./nav/telescope.nix

    ./visual/bufferline.nix
    ./visual/lualine.nix
    ./visual/mini.nix
  ];

  programs.nixvim.plugins.nix.enable = true;
  programs.nixvim.plugins.nvim-autopairs.enable = true;
  programs.nixvim.plugins.lz-n.enable = true;
}
