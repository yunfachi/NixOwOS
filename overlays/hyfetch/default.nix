_: finalPkgs: prevPkgs: {
  hyfetch = prevPkgs.hyfetch.overrideAttrs (
    finalAttrs: prevAttrs: {
      patches = [
        ./add_nixowos_support.patch
      ];
    }
  );
}
