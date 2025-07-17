{ ... }:

{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      autoLoad = true;
      inlayHints = true;
      servers = {
        pyright.enable = true;
        jdtls.enable = true;
        
        ccls = {
          enable = true;
          autostart = true;
          initOptions.compilationDatabaseDirectory = "build";
        };
        cmake.enable = true;
        cmake.autostart = true;

        gopls = {
          enable = true;
          settings = {
            completeUnimported = true;
            directoryFilters = [ "-.git" "-.vscode" "-.idea" "-.vscode-test" "-node_modules" ];
            hints = {
              assignVariableTypes = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariablesTypes = true;
            };
            analyses = {
              fieldalignment = true;
              nilness = true;
              unusedparams = true;
              unusedwrite = true;
              useany = true;
            };
          };
        };

        nixd.enable = true;
        nixd.autostart = true;
      };
    };
  };
}
