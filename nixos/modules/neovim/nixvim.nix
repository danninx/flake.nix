{ config, lib, pkgs, nixvim, ... }:

{
	programs.nixvim = {
		enable = true;
		colorschemes.gruvbox.enable = true;
		viAlias = true;
		vimAlias = true;
		globals.mapleader = " ";

		opts = {
			shiftwidth = 4;
			tabstop = 4;
		};

		keymaps = [
		{
			mode = ["n"];
			key = "<leader>pv";
			action = "<cmd>Ex<CR>";
		}
		];
	};
}
