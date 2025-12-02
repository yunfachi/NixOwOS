{
  description = "Complete redesign of NixOS into NixOwOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    denix.url = "github:yunfachi/denix/rewrite";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    {
      flake-parts,
      denix,
      self,
      ...
    }@inputs:
    flake-parts.lib.mkFlake
      {
        inherit inputs;
        specialArgs.delib = denix.lib;
      }
      (
        { config, delib, ... }:
        {
          imports = [
            denix.flakeModule
          ]
          ++ delib.umport {
            paths = [
              ./flake
              ./src
              ./pkgs
              ./overlays
            ];
          };
          systems = import inputs.systems;

          denixSettings = {
            generateSystems = false;
            generateModules = false;
          };

          denix.imports = with denix.denixModules; [ homeManager ];

          flake = {
            nixosModules = {
              default = self.nixosModules.nixowos;
              nixowos = config.denixConfiguration.genModule {
                moduleSystem = "nixos";
              };
            };

            homeModules = {
              default = self.homeModules.nixowos;
              nixowos = config.denixConfiguration.genModule {
                moduleSystem = "home";
              };
            };
          };
        }
      );
}
