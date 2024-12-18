{ config, lib, pkgs, nixvim, ... }:

{
	programs.nixvim.plugins.treesitter = {
		enable = true;

		grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
			markdown
			nix
		];
	};
}

