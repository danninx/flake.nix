{ fetchFromGitHub, stdenv }:

let
  p5-grub = fetchFromGitHub {
    owner = "SiriusAhu";
    repo = "Persona_5_Royal_Grub_Themes";
    rev = "07f4660631d6002aafe9f14dfa77849e979477ac";
    hash = "sha256-/4i5Br3f7FlQcy5GFIRcycGR7gPVemElJc5uyi2LgRc=";
  };

  make-theme = name: stdenv.mkDerivation {
    pname = "p5-grub.${name}";
    version = "0.1.0";
    src = p5-grub;
    installPhase = "cp -r $src/themes/${name} $out";
  };
in

{
  crow = make-theme "crow";
  fox = make-theme "fox";
  joker = make-theme "joker";
  mona = make-theme "mona";
  navi = make-theme "navi";
  noar = make-theme "noar";
  panther = make-theme "panther";
  queen = make-theme "queen";
  skull = make-theme "skull";
  violet = make-theme "violet";
}
