self: super: {
  discord = super.discord.overrideAttrs (old: {
    pname = "discord-wrapped";

    nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ super.makeWrapper ];

    postInstall = ''
      mv $out/bin/discord $out/bin/discord-original
      makeWrapper $out/bin/discord-original $out/bin/discord \
      --add-flags "--enable-gpu-rasterization" \
    '';
  });
}
