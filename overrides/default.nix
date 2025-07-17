self: super: {
  # not working
  # discord = (super.discord.override {
  #   commandLineArgs = "--disable-gpu --disable-software-rasterization";
  # });

  vscode.fhs = (super.vscode.override {
    commandLineArgs = "--use-angle=vulkan";
  }).fhs;
}
  
