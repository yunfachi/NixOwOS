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

    neofetch = boolOption true;
    nixos-icons = boolOption true;
  };

  config = lib.mkIf (cfg.enable && cfg.overlays.enable) {
    nixpkgs.overlays = with self.overlays;
      lib.optionals cfg.overlays.neofetch [neofetch]
      ++ lib.optionals cfg.overlays.nixos-icons [nixos-icons];
  };
}
