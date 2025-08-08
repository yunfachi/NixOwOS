{
  delib,
  self,
  ...
}: {
  lib,
  config,
  ...
}: let
  cfg = config.nwixowos;
in {
  options.nwixowos.overlays = with delib;
    (lib.mapAttrs (
        name: value:
          description (boolOption cfg.overlays.enable) "Whether to enable the ${name} overlay."
          // {
            defaultText = lib.literalExpression "config.nwixowos.overlays.enable";
          }
      )
      self.overlays)
    // {
      enable = description (boolOption true) "Whether to enable all NwixOwOS overlays by default.";
    };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = builtins.concatMap (
      name: lib.optionals cfg.overlays.${name} [self.overlays.${name}]
    ) (builtins.attrNames self.overlays);
  };
}
