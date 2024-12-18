{
	imports = [
        ./cmp.nix
		./telescope.nix
		./treesitter.nix
	];

    programs.nixvim.plugins.nvim-autopairs.enable = true;
    programs.nixvim.plugins.nix.enable = true;
    programs.nixvim.plugins.lualine.enable = true;
}
