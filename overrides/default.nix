self: super: {
  # not working

  discord = super.discord.overrideAttrs (old: {
    pname = "discord-wrapped";

    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ super.makeWrapper ];

    postInstall = ''
      mv $out/bin/discord $out/bin/discord-original
      makeWrapper $out/bin/discord-original $out/bin/discord \
      --add-flags "--enable-gpu-rasterization" \
    '';
  });

  # not working
  vscode.fhs = super.vscode.fhs.overrideAttrs (old: {
    commandLineArgs = "--user-angle=vulkan";
  });
}
