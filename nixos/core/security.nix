{ pkgs, ... }:

let
  checkfile = path: if builtins.pathExists path
                    then [ builtins.readFile path ]
                    else [];
  pki_1 = (checkfile ../../secrets/1.pki); # currently not working? looking into it later
in
{
  security = {
    # CC PKI
    pki.certificates = [
    ] ++ pki_1;
  };

  environment.systemPackages = with pkgs; [
    # Some password generators
    diceware
    pwgen-secure
  ];  

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
