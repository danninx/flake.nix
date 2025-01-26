{ ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
    autoLogin = {
      enable = true;
      user = "danninx";
    };
  };
}
