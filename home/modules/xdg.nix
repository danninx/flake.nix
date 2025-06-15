{ config, ... }:

let
  default = s: "${config.home.homeDirectory}/${s}";
  media = s: (default "Media/${s}");
in
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = default "Desktop";
      documents = default "Documents";
      download = default "Downloads";
      music = media "Music";
      pictures = media "Pictures";
      publicShare = default "Public";
      templates = default "Templates";
      videos = media "Videos";
    };
  };
}
