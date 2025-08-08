{delib, ...} @ args: {
  options.nixowos = with delib; {
    enable = description (boolOption false) "Whether to enable the NixOwOS module for NixOS.";

    id = description (strOption "nixowos") "The machine-readable identifier used in place of \"nixos\".";
    name = description (strOption "NixOwOS") "The human-readable name used in place of \"NixOS\".";
  };

  imports = map (file: import file args) (
    delib.umport {
      path = ./.;
      exclude = [./default.nix];
    }
  );
}
