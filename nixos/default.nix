{delib, ...} @ args: {
  options.nwixowos = with delib; {
    enable = description (boolOption false) "Whether to enable the NwixOwOS module for NixOS.";

    id = description (strOption "nwixowos") "The machine-readable identifier used in place of \"nixos\".";
    name = description (strOption "NwixOwOS") "The human-readable name used in place of \"NixOS\".";
  };

  imports = map (file: import file args) (
    delib.umport {
      path = ./.;
      exclude = [./default.nix];
    }
  );
}
