_packages: _finalPkgs: prevPkgs: {
  fastfetch-unwrapped = prevPkgs.fastfetch-unwrapped.overrideAttrs (
    _finalAttrs: _prevAttrs: {
      patches = [
        ./create_nixowos_logo.patch
      ];
    }
  );
}
