{ lib, ... }:
{
  imports = [ ./overlays.nix ];

  options.nixowos = {
    enable = lib.mkEnableOption "the NixOwOS module";

    id = lib.mkOption {
      type = lib.types.str;
      default = "nixowos";
      description = "The machine-readable identifier used in place of \"nixos\".";
    };
    name = lib.mkOption {
      type = lib.types.str;
      default = "NixOwOS";
      description = "The human-readable name used in place of \"NixOS\".";
    };
  };
}
