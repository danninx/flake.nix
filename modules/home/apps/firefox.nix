{ lib, pkgs, ... }:

let
  enforced = url: {
    install_url = url;
    installation_mode = "force_installed";
    private_browsing = false;
  };

  unenforced = url: {
    install_url = url;
    installation_mode = "normal_installed";
    private_browsing = false;
  };

  private = ext: {
    install_url = ext.install_url;
    installation_mode = ext.installation_mode;
    private_browsing = true;
  };

  lock = val: {
    Value = val;
    Status = "locked";
  };
in
{
  home.file.".mozilla/firefox/danninx/search.json.mozlz4".force = lib.mkForce true;
  programs.firefox = {
    enable = true;
    languagePacks = [
      "de"
      "en-US"
    ];

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
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = private (
          enforced "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
        ); # uBlock Origin
        "jid1-MnnxcxisBPnSXQ@jetpack" = private (
          enforced "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi"
        ); # Privacy Badger
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = private (
          enforced "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi"
        ); # Proton Pass
        "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}" = private (
          unenforced "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-mauve-git/latest.xpi"
        ); # Catppuccin Mocha
      };

      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      PasswordManagerEnabled = false;

      Preferences = {
        "extensions.pocket.enabled" = lock false;
        "extensions.screenshots.disabled" = lock true;
        "browser.formfill.enable" = lock false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock false;
        "browser.newtabpage.activity-stream.feeds.snippets" = lock false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock false;
        "browser.newtabpage.activity-stream.showSponsored" = lock false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock false;
        "browser.topsites.contile.enabled" = lock false;
      };
    };

    profiles = {
      danninx = {
        isDefault = true;
        name = "danninx";
        search = {
          default = "ddg";
          privateDefault = "ddg";

          engines = {
            "Home Manager Options" = {
              urls = [
                {
                  template = "https://home-manager-options.extranix.com";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                    {
                      name = "release";
                      value = "master";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@ho" ];
            };

            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };

            "reddit" = {
              urls = [
                {
                  template = "https://www.reddit.com/search/?q=%s";
                }
              ];
              definedAliases = [ "@red" ];
            };
          };
        };
        settings = {

        };
      };
    };
  };
}
