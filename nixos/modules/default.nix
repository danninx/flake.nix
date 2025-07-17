{ ... }:

{
  imports = [
    ./always      # modules that are always enabled (arguably belong in core)
    ./optionals   # modules that must be enabled via the "dnix.[module]" variable
  # ./explicit      modules that must be explicitly imported, and default to off
  ];
}

