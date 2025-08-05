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
  options.nwixowos.os-release = with delib; {
    enable = boolOption true;
    changeId = boolOption true;
    changeName = boolOption true;
    setIdLike = boolOption true;
  };

  config = lib.mkIf (cfg.enable && cfg.os-release.enable) {
    system.nixos = {
      distroId = lib.mkIf cfg.os-release.changeId cfg.id;
      distroName = lib.mkIf cfg.os-release.changeName cfg.name;
      vendorId = lib.mkIf cfg.os-release.changeId cfg.id;
      vendorName = lib.mkIf cfg.os-release.changeName cfg.name;
      extraOSReleaseArgs.ID_LIKE = lib.mkIf cfg.os-release.setIdLike "nixos";
    };
  };
}
