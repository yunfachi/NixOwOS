{
  flake.overlays.hyfetch =
    finalPkgs: prevPkgs:
    prevPkgs.hyfetch.overrideAttrs (
      finalAttrs: prevAttrs: {
        patches = [
          ./add_nixowos_support.patch
        ];
      }
    );
}
