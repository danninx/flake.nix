{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        type = "kitty-direct";
        source = "nixos_small";

        padding = {
          left = 2;
          right = 2;
        };

        width = 25;
        height = 25;
      };

      modules = [
        "title"
        "separator"
        "host"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "separator"
      ];
    };
  };
}
