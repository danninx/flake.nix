{ config, lib, pkgs, nixvim, ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      html
      markdown
      markdown_inline
      latex
      nix

      # Web development
      javascript
      typescript
    ];
  };
}

