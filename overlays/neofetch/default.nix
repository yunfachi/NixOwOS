_: finalPkgs: prevPkgs: {
  neofetch = prevPkgs.neofetch.overrideAttrs (
    finalAttrs: prevAttrs: {
      patches = [
        (finalPkgs.fetchpatch {
          url = "https://github.com/dylanaraps/neofetch/commit/413c32e55dc16f0360f8e84af2b59fe45505f81b.patch";
          sha256 = "1fapdg9z79f0j3vw7fgi72b54aw4brn42bjsj48brbvg3ixsciph";
          name = "avoid_overwriting_gio_extra_modules_env_var.patch";
        })
        ./improve_detect_nixos_version.patch
        ./create_nixowos_logo.patch
      ];
    }
  );
}
