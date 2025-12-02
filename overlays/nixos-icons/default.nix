{ self, ... }:
{
  flake.overlays.nixos-icons =
    finalPkgs: prevPkgs: self.packages.${finalPkgs.stdenv.hostPlatform.system}.nixowos-icons;
}
