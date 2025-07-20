self: super: {
  vscode.fhs = (super.vscode.override {
    commandLineArgs = "--use-angle=vulkan";
  }).fhs;
}

