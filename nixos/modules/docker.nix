{ config, lib, pkgs, ... }:

{
  users.extraGroups.docker.members = [ "danninx" ];

  # Testing container
  virtualisation = {
    docker.enable = true;
    oci-containers = {
      backend = "docker";

      containers.testing = {
        image = "nixos/nix";
        ports = [ "127.0.0.1:22:22" ];
        hostname = "testing";
        login = {
          username = "danni";
          passwordFile = "${config.users.users.danninx.home}/Documents/testing-password.txt";
        };
        autoStart = true;
      };
    };
  };
}
