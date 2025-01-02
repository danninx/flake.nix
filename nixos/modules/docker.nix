{ config, lib, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "danninx" ];

  # Testing container
  virtualisation.oci-containers.containers.testing = {
    image = "nixos/nix";
    ports = [ "127.0.0.1:22:22" ];
    hostname = "testing";
    login = {
      username = "danni";
      passwordFile = builtins.toString ~/Documents/testing-password.txt;
    };
  };
}
