{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.dnix.kde;
in

  {
    options = {
      dnix.kde.enable = mkEnableOption "Plasma6 and related configurations";
    };

    config = mkIf cfg.enable {
      services.xserver.enable = true;

      services.desktopManager.plasma6.enable = true;
      environment.plasma6.excludePackages = with pkgs.kdePackages; [
        konsole
        plasma-browser-integration
        ark
        elisa
        gwenview
        okular
        kate
        khelpcenter
      ];

      services.displayManager.defaultSession = "plasma";

      # Auto unlock kwallet on login
      security.pam.services.danninx.kwallet.enable = true;
    };
  }
