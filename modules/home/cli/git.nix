{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user.name = "danninx";
      user.email = "public.danninx@gmail.com";
      extraConfig = {
        core = {
          editor = "nvim";
        };
      };
    };
  };
}
