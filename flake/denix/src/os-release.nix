{
  delib,
  lib,
  ...
}:
{
  denix.modules.nixowos =
    { cfg, ... }:
    {
      options.os-release = with delib; {
        enable = boolOption true "Whether to enable os-release configuration.";

        changeId = boolOption true "Whether to override the default distribution ID in the `os-release` file.";
        changeName = boolOption true "Whether to override the default distribution name in the `os-release` file.";
        setIdLike = boolOption true "Whether to set the `ID_LIKE` field in `os-release` file to \"nixos\".";
      };

      nixos.ifEnabled = lib.mkIf cfg.os-release.enable {
        system.nixos = {
          distroId = lib.mkIf cfg.os-release.changeId cfg.id;
          distroName = lib.mkIf cfg.os-release.changeName cfg.name;
          vendorId = lib.mkIf cfg.os-release.changeId cfg.id;
          vendorName = lib.mkIf cfg.os-release.changeName cfg.name;
          extraOSReleaseArgs.ID_LIKE = lib.mkIf cfg.os-release.setIdLike "nixos";
        };
      };
    };
}
