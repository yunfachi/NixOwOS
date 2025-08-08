{
  delib,
  self,
  ...
}: {
  lib,
  config,
  ...
}: let
  cfg = config.nixowos;
in {
  options.nixowos.overlays = with delib;
    (lib.mapAttrs (
        name: value:
          description (boolOption cfg.overlays.enable) "Whether to enable the ${name} overlay."
          // {
            defaultText = lib.literalExpression "config.nixowos.overlays.enable";
          }
      )
      self.overlays)
    // {
      enable = description (boolOption true) "Whether to enable all NixOwOS overlays by default.";
    };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = builtins.concatMap (
      name: lib.optionals cfg.overlays.${name} [self.overlays.${name}]
    ) (builtins.attrNames self.overlays);
  };
}
