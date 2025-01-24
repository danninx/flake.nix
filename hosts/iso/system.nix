{ pkgs, ... }: 

{
  networking.hostName = "blank";

  environment.systemPackages = with pkgs; [
    nvim
    git
    pciutils
  ];
}
