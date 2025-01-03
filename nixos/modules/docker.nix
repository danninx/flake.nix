{ config, lib, pkgs, ... }:

{
  users.extraGroups.docker.members = [ "danninx" ];

  # Testing container
  virtualisation = {
    docker.enable = true;
    oci-containers = {
      backend = "docker";
    };
  };
}
