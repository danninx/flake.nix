{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    modules.usbs.enable = lib.mkEnableOption "installation of USB drive tools";
  };

  config = (
    lib.mkIf config.modules.usbs.enable {
      services.udisks2.enable = true;
      environment.systemPackages = [ pkgs.kdePackages.dolphin ];
    }
  );
}
