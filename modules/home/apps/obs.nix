{ config, lib, pkgs, ... }:

let
  obs = config.dots.obs;
in
{
  options = {
      dots.obs.enable = lib.mkEnableOption "obs-studio installation and preset";
  };

  config = lib.mkIf obs.enable {
    programs.obs-studio = {
      enable = true;

      package = (
        pkgs.obs-studio.override {
          cudaSupport = true;
        }
      );

      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-gstreamer
        obs-vkcapture
      ];
    };
  };
}
