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
  options.nwixowos.overlays = with delib; {
    enable = boolOption true;

    fastfetch = boolOption true;
    neofetch = boolOption true;
    nitch = boolOption true;
    nixos-icons = boolOption true;
  };

  config = lib.mkIf (cfg.enable && cfg.overlays.enable) {
    nixpkgs.overlays = with self.overlays;
      lib.optionals cfg.overlays.fastfetch [fastfetch]
      ++ lib.optionals cfg.overlays.neofetch [neofetch]
      ++ lib.optionals cfg.overlays.nitch [nitch]
      ++ lib.optionals cfg.overlays.nixos-icons [nixos-icons];
  };
}
