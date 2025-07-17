{ ... }:

{
  programs.nixvim.plugins.smear-cursor = {
    enable = false;
    settings = {
      opts = {
        smear_between_buffers = true;
        stiffness = 0.7;
        distance_stop_animating = 0.8;
      };
    };
  };
}
