{ pkgs, ... }:

{
  tim = (pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "danninx";
    repo = "tim";
    rev = "830d42eb354c3aab829094624f9a6e36ba76c18f";
    sha256 = "17vm8026mwxj81hw1b48pjnkx8c35dfykpcs8hp2qkaz8p0hlnx5";
  }) {});

  obs = (pkgs.wrapOBS {
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  });

}
