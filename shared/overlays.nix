{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.nixowos;
  overlays = import ../overlays { inherit pkgs; };
in
{
  options.nixowos.overlays =
    lib.attrsets.unionOfDisjoint
      {
        enable = lib.mkEnableOption "all NixOwOS overlays by default" // {
          default = true;
        };
      }
      (
        lib.mapAttrs (
          name: _:
          lib.mkEnableOption "the ${name} overlay"
          // {
            default = cfg.overlays.enable;
            defaultText = lib.literalExpression "config.nixowos.overlays.enable";
          }
        ) overlays
      );

  config = lib.mkIf cfg.useNixpkgsModule {
    nixpkgs.overlays = builtins.concatMap (
      name: lib.optionals cfg.overlays.${name} [ overlays.${name} ]
    ) (builtins.attrNames overlays);
  };
}
