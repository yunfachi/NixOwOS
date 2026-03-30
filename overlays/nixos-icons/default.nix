{ self, ... }:
{
  flake.overlays.nixos-icons = finalPkgs: prevPkgs: {
    nixos-icons = self.packages.${finalPkgs.stdenv.hostPlatform.system}.nixowos-icons;
  };
}
