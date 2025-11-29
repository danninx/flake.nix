{ ... }:

{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        alwaysDivideMiddle = true;
        globalstatus = true;
        ignoreFocus = [ "neo-tree" ];
        extensions = [];
        theme = "auto";

        section_separators = {
          left = "";
          right = "";
        };

        component_separators = {
          left = "·";
          right = "·";
        };
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [ "filename" "diff" ];

        lualine_x = [ "progress" ];
        lualine_y = [ "encoding" "filetype" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
