{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;

    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        source = "nixos";

        padding = {
          right = 2;
        };

        width = 18;
        height = 8;
      };

      modules = [
        "separator"

        "title"

        "separator"

        "host"
        "os"
        "kernel"
        "packages"

        "separator"

        "display"
        {
          type = "cpu";
          format = "{1} - {3} Cores";
        }
        {
          type = "gpu";
          key = "GPU";
        }
        "memory"
        "disk"
        "swap"

        "separator"

        "shell"
        "terminal"
        "battery"
        "separator"
      ];
    };
  };
}
