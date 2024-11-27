{ config, pkgs, ... }:

{
   nixpkgs.config.allowUnfree = true;

   home.username = "danninx";
   home.homeDirectory = "/home/danninx";
   home.stateVersion = "24.05";

   home.packages = [

   ];

   home.file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
   };

   programs.firefox = {
      enable = true;
      languagePacks = [ "de" "en-US" ];

      policies = {
         ExtensionSettings = {
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
               install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
               installation_mode = "force_installed";
            };
            # Privacy Badger:
            "jid1-MnnxcxisBPnSXQ@jetpack" = {
               install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
               installation_mode = "force_installed";
            };
         };
         OverrideFirstRunPage = "";
         OverridePostUpdatePage = "";
      };
   };

   programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
   };

   programs.vscode = {
      enable = true;

      extensions = with pkgs.vscode-extensions; [
         jdinhlife.gruvbox
         jnoortheen.nix-ide
         vscodevim.vim
      ];

      userSettings = {
         "editor.fontSize" = 14;
         "workbench.colorTheme" = "Gruvbox Dark Soft";
      };
   };

   home.sessionVariables = {
   };

   programs.home-manager.enable = true;
}
