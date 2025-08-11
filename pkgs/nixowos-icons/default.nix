{ assets, ... }:
{
  stdenv,
  imagemagick,
  lib,
  ...
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "nixowos-icons";
  version = "0-unstable-2025-08-05";

  src = assets;

  nativeBuildInputs = [ imagemagick ];

  installPhase = ''
    set -euo pipefail

    sizes="16 24 32 48 64 72 96 128 256 512 1024"
    category="apps"
    theme="hicolor"
    prefix="$out/share/icons/$theme"

    mkdir -p $prefix

    for size in $sizes; do
      dir="$prefix/''${size}x''${size}/$category"
      mkdir -p "$dir"
      convert -background none -resize ''${size}x''${size} "$src/nixowos-snowflake-colours.svg" "$dir/nix-snowflake.png"
      convert -background none -resize ''${size}x''${size} "$src/nixowos-snowflake-white.svg" "$dir/nix-snowflake-white.png"
    done

    # scalable icons
    for variant in colours white; do
      mkdir -p "$prefix/scalable/$category"
      cp "$src/nixowos-snowflake-''${variant}.svg" "$prefix/scalable/$category/nix-snowflake-''${variant}.svg"
    done
  '';

  meta = {
    description = "Icons of the NixOwOS logo, in Freedesktop Icon Directory Layout";
    homepage = "https://github.com/yunfachi/NixOwOS";
    license = lib.licenses.cc-by-40;
    maintainers = with lib.maintainers; [ yunfachi ];
    platforms = lib.platforms.all;
  };
})
