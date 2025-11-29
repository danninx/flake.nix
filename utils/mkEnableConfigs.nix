{ lib }:

# takes an attribute set `configs` in which each key is an enable option associated with a configuration attribute set
# {
#   foo = { environment.systemPackages = [ ... ]; };
#   bar = { environment.systemPackages = [ ... ]; };
# }
# =>
# options = { foo.enable = mkEnableOption "..." }
# config = mkMerge [ (mkIf config.foo.enable { ... })]

(configs: 
  { config, ... }:

  let 
    getOptions = (name: value: {
      dots.${name}.enable = lib.mkEnableOption "Whether to enable ${name} configurations";
    });
    getConfigs = (name: value: lib.mkIf config.dots.${name}.enable value);
  in

  {
    options = lib.mkMerge (lib.mapAttrsToList getOptions configs);
    config = lib.mkMerge (lib.mapAttrsToList getConfigs configs);
  }
)
