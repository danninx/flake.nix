{ lib }:

# takes an attribute set `config` and description to quickly make a simple enable option 
# mkEnableable "enable foo option" {
#   foo = {
#     environment... 
#   };
# }
# =>
# options = { foo.enable = mkEnableOption "enable foo option" }
# config = (mkIf foo.enable {
#   environment... 
# })

(description: attr:
  
  { config, ... }:
  let
    attrList = lib.attrsToList attr;

    multiErr = if (lib.length attrList) != 1
                then throw "mkEnableable: Expected a single configuration"
                else null;

    item = lib.head attrList;
  in
  {
    options = {
      dots.${item.name}.enable = lib.mkEnableOption description;
    };

    config = lib.mkIf config.dots.${item.name}.enable item.value;
  }  
)
