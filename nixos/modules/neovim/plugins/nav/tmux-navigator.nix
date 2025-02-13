{ ... }:

{
  programs.nixvim.plugins.tmux-navigator = {
    enable = true;
    keymaps = [
      {
        action = "left";
        key = "<M-h>";
      }
      {
        action = "down";
        key = "<M-j>";
      }
      {
        action = "up";
        key = "<M-k>";
      }
      {
        action = "right";
        key = "<M-l>";
      }
      {
        action = "previous";
        key = "<M-b>";
      }
    ];
  };
}
