_: finalPkgs: prevPkgs: {
  fastfetch = prevPkgs.fastfetch.overrideAttrs (
    finalAttrs: prevAttrs: {
      patches = [
        ./create_nwixowos_logo.patch
      ];
    }
  );
}
