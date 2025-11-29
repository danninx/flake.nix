{ config, lib, pkgs, ... }:

{
  options = {
    dots.games.enable = lib.mkEnableOption "installation of game tools";
  };

  config = (lib.mkIf config.dots.games.enable {
    programs = {
      gamemode.enable = true;
      steam = {
        enable = true;
        gamescopeSession.enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      mangohud
      prismlauncher
      protonup-qt
    ];
  });
}
