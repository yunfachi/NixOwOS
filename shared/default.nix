{ lib, ... }@args:
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

    useNixpkgsModule = lib.mkOption {
      type = lib.types.bool;
      default = !(args.osConfig.home-manager.useGlobalPkgs or false);
      defaultText = lib.literalMD "If `specialArgs.osConfig.home-manager.useGlobalPkgs` exists, then its negated value; otherwise, `true`.";
      description = "Whether to set values for the `nixpkgs` module. Needed to disable `nixpkgs` when using Home Manager as a module with `config.home-manager.useGlobalPkgs` set to `true`.";
    };
  };
}
