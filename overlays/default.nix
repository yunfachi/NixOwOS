{
  packages ? {
    ${pkgs.stdenv.hostPlatform.system} = import ../packages { inherit pkgs; };
  },
  pkgs ? null,
}:
builtins.mapAttrs (name: _: import ./${name} packages) (
  builtins.removeAttrs (builtins.readDir ./.) [ "default.nix" ]
)
