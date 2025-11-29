{ mkEnableable, pkgs, ... }:

mkEnableable "install USB drive tools" {
  usbs = {
    services.udisks2.enable = true;
    environment.systemPackages = [ pkgs.kdePackages.dolphin ];
  };
}
