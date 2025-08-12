{ self, ... }:
{
  lib,
  runCommand,
  nixosOptionsDoc,
  moduleSystem,
  ...
}:
let
  eval = lib.evalModules {
    modules = [
      {
        nixos = self.nixosModules.default;
        home = self.homeModules.default;
      }
      .${moduleSystem}
      { _module.check = false; }
    ];
  };

  optionsDoc = nixosOptionsDoc {
    options = lib.removeAttrs eval.options [ "_module" ];
    #warningsAreErrors = false;
  };
in
runCommand "nixowos-${moduleSystem}-docs.md" { } ''
  cat ${optionsDoc.optionsCommonMark} >> $out
''
