{ ... }:

{
  programs.nixvim.plugins.cursorline = {
    enable = true;

    settings = { 
      cursorline = {
        enable = true;
        timeout = 1000;
        number = false;
      };

      cursorword = {
        enable = false;
        minLength = 3;
        hl = {
          underline = true;
        };
      }; 
    };
  };
}
