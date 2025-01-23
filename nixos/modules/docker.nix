{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.dnix.docker;
in
  {
    options = {
      dnix.docker.enable = mkEnableOption "docker";
    };

    config = {
      users.extraGroups.docker.members = [ "danninx" ];

      virtualisation = {
        docker.enable = true;
        oci-containers = {
          backend = "docker";
        };
      };
    };
  }
