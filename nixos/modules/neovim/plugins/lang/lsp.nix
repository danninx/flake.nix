{ ... }:

{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      autoLoad = true;
      servers = {
        pyright.enable = true;
        # jdtls.enable = true;
        
        ccls = {
          enable = true;
          autostart = true;
          initOptions.compilationDatabaseDirectory = "build";
        };
        cmake.enable = true;
        cmake.autostart = true;

        nixd.enable = true;
        nixd.autostart = true;
      };
    };
  };
}
