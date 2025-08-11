{ delib, lib, ... }@args:
{ specialArgs, ... }:
{
  options.nixowos = with delib; {
    id = description (strOption "nixowos") "The machine-readable identifier used in place of \"nixos\".";
    name = description (strOption "NixOwOS") "The human-readable name used in place of \"NixOS\".";

    useNixpkgsModule =
      description (boolOption (!(specialArgs.osConfig.home-manager.useGlobalPkgs or false)))
        "Whether to set values for the `nixpkgs` module. Needed to disable `nixpkgs` when using Home Manager as a module with `config.home-manager.useGlobalPkgs` set to `true`."
      // {
        defaultText = lib.literalMD "If `specialArgs.osConfig.home-manager.useGlobalPkgs` exists, then its negated value; otherwise, `true`.";
      };
  };

  imports = map (file: import file args) (
    delib.umport {
      path = ./.;
      exclude = [ ./default.nix ];
    }
  );
}
