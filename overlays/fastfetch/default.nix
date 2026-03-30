{
  flake.overlays.fastfetch = finalPkgs: prevPkgs: {
    fastfetch = prevPkgs.fastfetch.overrideAttrs (
      finalAttrs: prevAttrs: {
        patches = [
          ./create_nixowos_logo.patch
        ];
      }
    );
  };
}
