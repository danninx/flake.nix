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
      ghc
      hunspell
      hunspellDicts.uk_UA
      jetbrains.idea-ultimate
      libreoffice-qt
      python312
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

  programs.nix-ld.enable = true;
  programs.zsh.enable = true;
}
