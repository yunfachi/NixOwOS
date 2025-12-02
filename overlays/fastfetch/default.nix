{
  flake.overlays.fastfetch =
    finalPkgs: prevPkgs:
    prevPkgs.fastfetch.overrideAttrs (
      finalAttrs: prevAttrs: {
        patches = [
          ./create_nixowos_logo.patch
        ];
      }
    );
}
