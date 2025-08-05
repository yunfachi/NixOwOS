{delib, ...} @ args: {
  options.nwixowos = with delib; {
    enable = boolOption false;

    id = strOption "nwixowos";
    name = strOption "NwixOwOS";
  };

  imports = map (file: import file args) (
    delib.umport {
      path = ./.;
      exclude = [./default.nix];
    }
  );
}
