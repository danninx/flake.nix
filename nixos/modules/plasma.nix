{ config, lib, pkgs, ... }:

with lib;
let
  plasma = config.dnix.plasma6;
in
{
  options = {
    dnix.plasma6.enable = mkEnableOption "Plasma6 and related configurations";
  };

  config = mkIf plasma.enable {
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

    # FIXME Autolock kwallet
    security.pam.services.danninx.kwallet.enable = true;
  };
}
