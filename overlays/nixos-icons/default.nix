{self, ...}: finalPkgs: prevPkgs: {
  nixos-icons = self.legacyPackages.${finalPkgs.system}.nwixowos-icons;
}
