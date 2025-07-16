{ buildGo124Module, fetchFromGitHub, lib }:

buildGo124Module {
  pname = "tim";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "danninx";
    repo = "tim";
    rev = "830d42eb354c3aab829094624f9a6e36ba76c18f";
    hash = "sha256-pVsKwUVfTSwuRJrd6V0rg6E+rbyIrMBhQLLzagRAdZ8=";
  };

  vendorHash = null;

  meta = {
    description = "templating script for common sources";
    license = lib.licenses.mit;
    homepage = "https://github.com/danninx/tim";
  };
}

