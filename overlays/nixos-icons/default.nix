packages: finalPkgs: _prevPkgs: {
  nixos-icons = packages.${finalPkgs.stdenv.hostPlatform.system}.nixowos-icons;
}
