{ config, lib, pkgs, ... }:

{
  options = {
    modules.cs4163.enable = lib.mkEnableOption "database systems course tools";
  };

  config = lib.mkMerge [
    (lib.mkIf config.modules.cs4163.enable {
      environment.systemPackages = with pkgs; [
        globalprotect-openconnect
        mysql-workbench
      ];

      services.globalprotect.enable = true;
    })
  ];
}

