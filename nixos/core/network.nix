{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.dnix.wireguard;
in
  {
    options = {
      dnix.wireguard.enable = mkEnableOption "wireguard firewall rules";
    };

    config = mkMerge [
      {
        networking = {
          hostName = "dtop";
          networkmanager.enable = true;
        };
      }

      (mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          wireguard-tools
        ];

        networking.firewall = {
          logReversePathDrops = true;

          extraCommands = ''
            ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
            ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
          '';
          extraStopCommands = ''
            ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
            ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
          '';
        };
      })
    ];
  }
