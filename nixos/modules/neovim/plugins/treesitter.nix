{ config, lib, pkgs, nixvim, ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      # latex
      c
      cpp
      java
      nix

      go

      markdown
      markdown_inline
      # Web development
      html
      javascript
      typescript
    ];
  };
}

