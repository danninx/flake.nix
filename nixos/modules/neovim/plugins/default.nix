{
  imports = [
    ./cmp.nix
    ./telescope.nix
    ./treesitter.nix
    ./vimtex.nix
  ];

  programs.nixvim.plugins.nvim-autopairs.enable = true;
  programs.nixvim.plugins.nix.enable = true;
  programs.nixvim.plugins.lualine.enable = true;
  programs.nixvim.plugins.web-devicons.enable = true;
  programs.nixvim.plugins.markview.enable = false;
}
