{ config, lib, pkgs, nixvim, ... }:

{
  programs.nixvim.plugins.markview.enable = true;
}
