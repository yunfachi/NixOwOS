{
  delib,
  self,
  ...
}:
{
  lib,
  config,
  ...
}:
let
  cfg = config.nixowos;
in
{
  options.nixowos.os-release = with delib; {
    enable = description (boolOption true) "Whether to enable os-release configuration.";

    changeId = description (boolOption true) "Whether to override the default distribution ID in the `os-release` file.";
    changeName = description (boolOption true) "Whether to override the default distribution name in the `os-release` file.";
    setIdLike = description (boolOption true) "Whether to set the `ID_LIKE` field in `os-release` file to \"nixos\".";
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
