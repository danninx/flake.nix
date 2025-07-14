{ config, ... }:

let
  default = s: "${config.home.homeDirectory}/${s}";
  media = s: (default "media/${s}");
in
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = default "desktop";
      documents = default "documents";
      download = default "downloads";
      music = media "music";
      pictures = media "pictures";
      publicShare = default "public";
      templates = default "templates";
      videos = media "videos";
    };
  };
}
