{
  flake.overlays.systemd = finalPkgs: prevPkgs: {
    systemd = prevPkgs.systemd.overrideAttrs (
      finalAttrs: prevAttrs: {
        patches = (prevAttrs.patches or [ ]) ++ [
          ./nixowos_support.patch
        ];
      }
    );
    nix = prevPkgs.nix.overrideAttrs (old: {
      doCheck = false;
    });
  };
}
