{ pkgs, ... }:

{
    networking = {
      networkmanager = {
        enable = true;
        plugins = with pkgs; [
          networkmanager-openvpn
        ];
      };
      firewall = {
        allowPing = false;
        enable = true;
        logReversePathDrops = true;
      };
    };

    services.tailscale.enable = true;
}
