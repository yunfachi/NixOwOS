{self, ...}: finalPkgs: prevPkgs: {
  nixos-icons = self.legacyPackages.${finalPkgs.system}.nixowos-icons;
}
