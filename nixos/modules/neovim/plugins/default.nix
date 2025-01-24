{
  imports = [
    ./bufferline.nix
    ./cmp.nix
    ./lualine.nix
    # ./neo-tree.nix -- didn't like the side bar
    ./mini.nix
    ./oil.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim.plugins.nix.enable = true;
  programs.nixvim.plugins.nvim-autopairs.enable = true;
  programs.nixvim.plugins.lz-n.enable = true;
  # programs.nixvim.plugins.web-devicons.enable = true;
}
