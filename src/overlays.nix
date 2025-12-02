{
  delib,
  lib,
  self,
  ...
}:
{
  denix.modules.nixowos =
    { cfg, ... }:
    {
      options.overlays =
        with delib;
        strictMergeAttrs
          {
            enable = description (boolOption true) "Whether to enable all NixOwOS overlays by default.";
          }
          (
            lib.mapAttrs (
              name: value:
              description (boolOption cfg.overlays.enable) "Whether to enable the ${name} overlay."
              // {
                defaultText = lib.literalExpression "config.nixowos.overlays.enable";
              }
            ) self.overlays
          );

      nixos.ifEnabled = lib.mkIf cfg.useNixpkgsModule {
        nixpkgs.overlays = builtins.concatMap (
          name: lib.optionals cfg.overlays.${name} [ self.overlays.${name} ]
        ) (builtins.attrNames self.overlays);
      };

      home.ifEnabled = lib.mkIf cfg.useNixpkgsModule {
        nixpkgs.overlays = builtins.concatMap (
          name: lib.optionals cfg.overlays.${name} [ self.overlays.${name} ]
        ) (builtins.attrNames self.overlays);
      };
    };
}
