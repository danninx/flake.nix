{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.dnix.keybase;
in

  {
    options = {
      dnix.keybase.enable = mkEnableOption "keybase, kbfs and installation of the keybase GUI";
    };

    config = mkIf cfg.enable {
      services.keybase.enable = true;
      services.kbfs.enable = true;

      environment.systemPackages = with pkgs; [
        keybase-gui
      ];
    };
  }
