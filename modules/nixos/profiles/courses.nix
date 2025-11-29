{ pkgs, mkEnableConfigs, ... }:

mkEnableConfigs {
  courses.cs4163 = {
    environment.systemPackages = with pkgs; [
      globalprotect-openconnect
      mysql-workbench
    ];

    services.globalprotect.enable = true;
  };
}
