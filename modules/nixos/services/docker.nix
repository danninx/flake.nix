{ mkEnableable, ... }:

mkEnableable "docker" {
  docker = {
    users.extraGroups.docker.members = [ "danninx" ];
    virtualisation = {
      docker = {
        enable = true;
      };
      oci-containers = {
        backend = "docker";
      };
    };
  };
}

