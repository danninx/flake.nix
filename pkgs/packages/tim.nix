{ buildGo124Module, fetchFromGitHub, lib }:

buildGo124Module {
  pname = "tim";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "danninx";
    repo = "tim";
    rev = "fd183ede4038b82822c611e9d8687124d95424ed";
    hash = "sha256-IjgDz7wBzDLK7ae0HNfrOOUuup3xTA4LA1GAFx4eGOs=";
  };

  vendorHash = "sha256-GkwY1Y8n7vOJ2VFMjZP3Aew65HIPxQ/hb2eY2wq7rmE=";

  meta = {
    description = "templating script for common sources";
    license = lib.licenses.mit;
    homepage = "https://github.com/danninx/tim";
  };
}

