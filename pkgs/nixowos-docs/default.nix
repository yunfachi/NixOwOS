{ self, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      nixowos-docs =
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
        '';
    in
    {
      packages = {
        nixowos-nixos-docs = pkgs.callPackage nixowos-docs { moduleSystem = "nixos"; };
        nixowos-home-docs = pkgs.callPackage nixowos-docs { moduleSystem = "home"; };
      };
    };
}
