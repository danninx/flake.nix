{ config, lib, pkgs, ... }:

with lib; let
  cfg = config.dnix.yubikey-software;
in
  {
    options = {
      dnix.yubikey-software.enable = mkEnableOption "yubikey tools and installation (automatically enables gnupg)";
    };

    config = mkIf cfg.enable {
      services.udev.packages = with pkgs; [
        yubikey-manager
        yubikey-personalization-gui
        yubikey-personalization
        yubico-piv-tool
        yubioath-flutter
      ];
    };
  }
