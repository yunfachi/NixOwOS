{
  delib,
  root,
  ...
}@args:
{
  options.nixowos = with delib; {
    enable = description (boolOption false) "Whether to enable the NixOwOS module for NixOS.";
  };

  imports = [
    (import (root + /shared) args)
  ]
  ++ map (file: import file args) (
    delib.umport {
      path = ./.;
      exclude = [ ./default.nix ];
    }
  );
}
