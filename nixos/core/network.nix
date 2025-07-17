{ pkgs, ... }:

{
  config = {
    networking = {
      networkmanager.enable = true;
      firewall = {
        allowPing = false;
        enable = true;
        logReversePathDrops = true;
      };
    };

    services.tailscale.enable = true;
  };
}
