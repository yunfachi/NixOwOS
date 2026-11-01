_packages: _finalPkgs: prevPkgs: {
  pfetch = prevPkgs.pfetch.overrideAttrs (
    _finalAttrs: prevAttrs: {
      patches = prevAttrs.patches or [ ] ++ [
        ./nixowos_support.patch
      ];
    }
  );
}
