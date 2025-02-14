{ pkgs, ... }:

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
    oh-my-posh

    sioyek

    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

    vlc

    fuzzel
    rars
    arduino-ide
  ];
}
