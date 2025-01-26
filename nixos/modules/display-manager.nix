{ ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
<<<<<<< Updated upstream
    autoNumlock = true;
    autoLogin.relogin = true;
=======
    autoLogin = {
      enable = true;
      user = "danninx";
    };
>>>>>>> Stashed changes
  };
}
