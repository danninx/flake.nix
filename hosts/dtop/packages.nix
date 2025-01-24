{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty

    gnumake
    gcc
    jdk
    zig
    wget

    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA

    tmux # when will I finally configure this... :(
    sioyek

    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

    vlc
  ];
}
