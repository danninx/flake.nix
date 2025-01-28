{ lib, pkgs, ... }:

let
  gap = 5;
in
  {
    home.packages = with pkgs.kdePackages; [ krohnkite ];
    programs.plasma = {
      configFile.kwinrc = {
        Script-krohnkite = {
          enableBTreeLayout.value = true;
          enableColumnsLayout.value = false;
          enableMonocleLayout.value = false;
          enableSpiralLayout.value = false;
          enableSpreadLayout.value = false;
          enableStairLayout.value = false;
          enableThreeColumnLayout.value = false;
          enableTileLayout.value = false;

          ignoreClass = lib.concatStringsSep "," [
            "kded"
            "krunner"
            "ksshaskpass"
            "org.freedesktop.impl.portal.desktop.kde"
            "org.kde.plasmashell"
            "org.kde.polkit-kde-authentication-agent-1"
            "qalculate-qt"
            "spectacle"
            "xwaylandvideobridge"
            "yakuake"
          ];
          ignoreTitle = lib.concatStringsSep "," [
            "Configure — System Settings"
            "KDE Wayland Compositor"
          ];

          screenGapBottom.value = gap;
          screenGapLeft.value = gap;
          screenGapRight.value = gap;
          screenGapTop.value = gap;
          tileLayoutGap.value = gap;
        };
        Plugins.krohnkiteEnabled.value = true;
      };

      kwin = {
        effects = {
          blur = {
            enable = true;
            noiseStrength = 4;
            strength = 7;
          };
        };

        virtualDesktops = {
          names = [ "Desktop 1" "Desktop 2" "Desktop 3" "Desktop 4" "Desktop 5" ];
          number = 5;
          rows = 1;
        };
      };
    };
  }
