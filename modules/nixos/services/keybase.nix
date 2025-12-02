{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    modules.keybase.enable = lib.mkEnableOption "installation of keybase and kbfs";
  };

  config = (
    lib.mkIf config.modules.keybase.enable {
      services.keybase.enable = true;
      services.kbfs.enable = true;
      services.kbfs.mountPoint = "%h/.kbfs";

      environment.systemPackages = with pkgs; [
        keybase-gui
      ];
    }
  );
}
