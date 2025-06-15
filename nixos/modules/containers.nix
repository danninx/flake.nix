{ config, lib, pkgs, ... }:

with lib;
let
  docker = config.dnix.docker;
  podman = config.dnix.podman;
in
  {
    options = {
      dnix.docker.enable = mkEnableOption "docker";
      dnix.podman.enable = mkEnableOption "podman";
    };

    config = mkMerge [
      # docker
      (mkIf docker.enable {
        users.extraGroups.docker.members = [ "danninx" ];

        virtualisation = {
          docker.enable = true;
          oci-containers = {
            backend = "docker";
          };
        };

        users.users.danninx.packages = with pkgs; [
          kubectl
          minikube
        ];
      })

      # podman
      (mkIf podman.enable {
        virtualisation = {
          containers.enable = true;
          podman = {
            enable = true;
            dockerCompat = true;
            defaultNetwork.settings.dns_enabled = true;
          };
        };

        environment.systemPackages = with pkgs; [
          dive
          podman-tui
          podman-compose
        ];
      })
    ];
  }
