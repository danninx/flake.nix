{ pkgs, ... }:

let
  checkfile = path: if builtins.pathExists path
                    then [ builtins.readFile path ]
                    else [];
  pki_1 = (checkfile ../../secrets/1.pki);
in
{
  security = {
    pki.certificates = [
    ] ++ pki_1;
  };

  environment.systemPackages = with pkgs; [
    diceware
    pwgen-secure
  ];  

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh = {
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "danninx" ];
    };
  };
}
