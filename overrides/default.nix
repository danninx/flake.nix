self: super: {
  vscode.fhs = (super.vscode.override {
    commandLineArgs = "--use-angle=vulkan";
  }).fhs;

  flameshot = (super.flameshot.overrideAttrs (old: {
    cmakeFlags = old.cmakeFlags or [ ] ++ [ "-DUSE_WAYLAND_GRIM=ON" ];
  }));
}

