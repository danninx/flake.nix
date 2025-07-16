self: super: let
 call = path: super.callPackage path {};
in {
  tim = super.callPackage ./packages/tim.nix {};
}
