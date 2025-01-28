{ ... }:

{
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "danninx";
    };
    sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
    };
  };
}
