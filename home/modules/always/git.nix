{ ... }:

{
  programs.git = {
    enable = true;
    userName = "danninx";
    userEmail = "public.danninx@gmail.com";
    lfs.enable = true;

    extraConfig = {
      core = {
        editor = "nvim";
      };
    };
  };
}
