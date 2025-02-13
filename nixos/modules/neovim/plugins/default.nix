{
  imports = [
    ./extra/nvim-autopairs.nix
    ./extra/surround.nix

    ./lang/cmp.nix
    ./lang/nix.nix
    ./lang/treesitter.nix
    ./lang/lsp.nix

    ./nav/oil.nix
    ./nav/telescope.nix

    ./visual/bufferline.nix
    ./visual/cursorline.nix
    ./visual/lualine.nix
    ./visual/mini.nix
    ./visual/smear.nix
  ];

  programs.nixvim.plugins.lz-n.enable = true;
}
