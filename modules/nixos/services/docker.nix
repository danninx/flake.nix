{ config, lib, ... }:

{
  options = {
    modules.docker.enable = lib.mkEnableOption "docker backend";
  };

  config = (lib.mkIf config.modules.docker.enable {
    users.extraGroups.docker.members = [ "danninx" ];
    virtualisation = {
      docker = {
        enable = true;
      };
      oci-containers = {
        backend = "docker";
      };
    };
  });
}

