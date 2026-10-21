{
  pkgs ? import <nixpkgs> { },
}:
builtins.mapAttrs (name: _: pkgs.callPackage ./${name} { }) (
  builtins.removeAttrs (builtins.readDir ./.) [ "default.nix" ]
)
