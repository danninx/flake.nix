{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.dnix.wireguard;
in
  {
    options = {
      dnix.wireguard.enable = mkEnableOption "wireguard and firewall rules";
    };

    config = mkMerge [
      {
        networking = {
          hostName = "dtop";
          networkmanager.enable = true;
          firewall = {
            allowPing = false;
            enable = true;
            logReversePathDrops = true;
          };
        };
      }

      (mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          wireguard-tools
        ];

        networking.firewall = {
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
