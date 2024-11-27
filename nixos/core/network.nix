{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "dtop";
    networkmanager.enable = true;
  };
}