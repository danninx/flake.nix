{ ... }:

{
  programs.nixvim.plugins.cursorline = {
    enable = true;

    settings = {
      cursorline = {
        enable = true;
        timeout = 250;
        number = true;
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
