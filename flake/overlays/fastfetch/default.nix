{
  flake.overlays.fastfetch = _finalPkgs: prevPkgs: {
    fastfetch = prevPkgs.fastfetch.overrideAttrs (
      _finalAttrs: _prevAttrs: {
        patches = [
          ./create_nixowos_logo.patch
        ];
      }
    );
  };
}
