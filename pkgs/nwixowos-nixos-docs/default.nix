{self, ...}: {
  lib,
  runCommand,
  nixosOptionsDoc,
  ...
}: let
  eval = lib.evalModules {
    modules = [
      self.nixosModules.default
      {_module.check = false;}
    ];
  };

  optionsDoc = nixosOptionsDoc {
    options = lib.removeAttrs eval.options ["_module"];
    #warningsAreErrors = false;
  };
in
  runCommand "nwixowos-nixos-docs.md" {} ''
    cat ${optionsDoc.optionsCommonMark} >> $out
  ''
