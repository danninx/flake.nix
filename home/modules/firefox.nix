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
                #Vimium (vim keybinds for )
                "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
                  install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
                  installation_mode = "normal_installed";
                };
              };
              OverrideFirstRunPage = "";
              OverridePostUpdatePage = "";
            };
          };
        }
