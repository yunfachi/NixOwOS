{
  flake.overlays.systemd = finalPkgs: prevPkgs: {
    suwustemd = prevPkgs.systemd.overrideAttrs (
      finalAttrs: prevAttrs: {
        patches = (prevAttrs.patches or [ ]) ++ [
          ./nixowos_support.patch
        ];
      }
    );
  };
}
