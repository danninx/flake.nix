{ config, pkgs, ... }:

{
   home.username = "danninx";
   home.homeDirectory = "/home/danninx";
   home.stateVersion = "24.05";

   home.packages = [

   ];

   home.file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
   };

   programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
   };

   home.sessionVariables = {
   };

   programs.home-manager.enable = true;
}
