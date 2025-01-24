{ config, pkgs, ... }:

{
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

        #Privacy Badger:
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
    };

    profiles = {
      danninx = {
        isDefault = true;
        name = "danninx";
        bookmarks = [
          #FIXME add some bookmarks
        ];
      };
    };
  };
}
