{ mkEnableable, pkgs, ... }:

mkEnableable "install keybase and necessary programs" {
  keybase = {
    services.keybase.enable = true;
    services.kbfs.enable = true;
    services.kbfs.mountPoint = "%h/.kbfs";

    environment.systemPackages = with pkgs; [
      keybase-gui
    ];
  };
}
