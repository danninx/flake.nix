{ lib, pkgs, ... }:

let
  DefaultExtensionSettings = {
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };

        #Privacy Badger:
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };

        #Proton Pass:
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
          installation_mode = "normal_installed";
          private_browsing = true;
        };

        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "normal_installed";
          private_browsing = false;
        };
      };
in
  {
    home.file.".mozilla/firefox/danninx/search.json.mozlz4".force = lib.mkForce true;
    programs.firefox = {
      enable = true;
      languagePacks = [ "de" "en-US" ];

      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisableFormHistory = true;
        DisableMasterPasswordCreation = true;
        DisablePocket = true;
        DisableSetDesktopBackground = true;
        DisableTelemetry = true;

        DontCheckDefaultBrowser = true;
        OfferToSaveLogins = false;

        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        ExtensionSettings = DefaultExtensionSettings;

        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        PasswordManagerEnabled = false;

        WebsiteFilter = {
          Block = [
          #"*://*.youtube.com/*"
        ];
      };
    };

    profiles = {
      danninx = {
        isDefault = true;
        name = "danninx";
        search = {
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";

          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "channel"; value = "unstable"; }
                    { name = "query";   value = "{searchTerms}"; }
                  ];
                }
              ];
              icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    { name = "channel"; value = "unstable"; }
                    { name = "query";   value = "{searchTerms}"; }
                  ];
                }
              ];
              icon           = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };
          };
        };
      };
    };
  };
}
