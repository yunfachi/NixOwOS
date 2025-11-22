{ self, ... }:
finalPkgs: prevPkgs: {
  nixos-icons = self.legacyPackages.${finalPkgs.stdenv.hostPlatform.system}.nixowos-icons;
}
