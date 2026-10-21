{
  lib,
  config,
  ...
}:
let
  cfg = config.nixowos;
in
{
  options.nixowos.os-release = {
    enable = lib.mkEnableOption "os-release configuration" // {
      default = true;
    };

    changeId = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to override the default distribution ID in the `os-release` file.";
    };
    changeName = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to override the default distribution name in the `os-release` file.";
    };
    setIdLike = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to set the `ID_LIKE` field in `os-release` file to \"nixos\".";
    };
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
