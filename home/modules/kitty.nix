{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = false;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 5;

      background_blur = 0;
    };
  };
}
