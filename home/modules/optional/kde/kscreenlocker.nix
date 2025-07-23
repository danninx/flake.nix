{ config, lib, ... }:

with lib;
let
  plasma = config.dnix.plasma6;
in
  {
    config = mkIf plasma.enabled {
      programs.plasma.kscreenlocker = {
        autoLock = true;
        lockOnResume = true;
        lockOnStartup = true;
        timeout = 5;
      };
    };
  }
