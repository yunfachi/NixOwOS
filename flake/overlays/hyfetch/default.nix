{
  flake.overlays.hyfetch = _finalPkgs: prevPkgs: {
    hyfetch = prevPkgs.hyfetch.overrideAttrs (
      _finalAttrs: _prevAttrs: {
        patches = [
          ./add_nixowos_support.patch
        ];
      }
    );
  };
}
