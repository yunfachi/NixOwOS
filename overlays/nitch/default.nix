{
  flake.overlays.nitch =
    finalPkgs: prevPkgs:
    prevPkgs.nitch.overrideAttrs (
      finalAttrs: prevAttrs: {
        patches = [
          ./nixowos_support.patch
          (finalPkgs.fetchpatch {
            url = "https://github.com/ssleert/nitch/commit/ff10dea47dbc4d9736bd839b87869f53166cf395.patch";
            hash = "sha256-n7JtI1Td0xMqhuScnMvxTkbY2I+l+FcUTz7aytxFasE=";
          })
        ];
      }
    );
}
