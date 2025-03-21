{ pkgs, ... }:

{
  users.users.danninx = {
    isNormalUser = true;
    description = "danninx";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    packages = with pkgs; [
      arduino-ide
      discord
      flameshot
      fuzzel
      hunspell
      hunspellDicts.uk_UA
      jetbrains.idea-ultimate
      libreoffice-qt
      qbittorrent
      rars
      sioyek
      unzip
      vlc

      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
