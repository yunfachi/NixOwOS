{
  description = "Complete redesign of NixOS into NixOwOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    denix = {
      url = "github:yunfachi/denix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs = {
    nixpkgs,
    denix,
    pre-commit-hooks,
    self,
    ...
  }: let
    _call = file: extraArgs:
      import file (
        {
          inherit self;
          delib = denix.lib;
          assets = ./assets;
        }
        // extraArgs
      );
    call = file: _call file {};

    forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
  in {
    nixosModules = rec {
      default = nixowos;
      nixowos = call ./nixos;
    };

    overlays = {
      fastfetch = final: prev: call ./overlays/fastfetch final prev;
      neofetch = final: prev: call ./overlays/neofetch final prev;
      nitch = final: prev: call ./overlays/nitch final prev;
      nixos-icons = final: prev: call ./overlays/nixos-icons final prev;
    };

    legacyPackages = forAllSystems (
      system: let
        callPackage = file: nixpkgs.legacyPackages.${system}.callPackage (_call file {inherit system;}) {};
      in {
        nixowos-icons = callPackage ./pkgs/nixowos-icons;
        nixowos-nixos-docs = callPackage ./pkgs/nixowos-nixos-docs;
      }
    );

    checks = forAllSystems (system: {
      pre-commit-check = pre-commit-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          alejandra.enable = true;

          nixowos-generate-docs = {
            enable = true;
            name = "NixOwOS generate docs";
            files = ".*";
            language = "system";
            entry =
              (nixpkgs.legacyPackages.${system}.writeShellScript "nixowos-generate-docs.sh" ''
                cat $(nix build .#legacyPackages.${system}.nixowos-nixos-docs --print-out-paths --no-link) > ./nixos/README.md
                git add ./nixos/README.md
              '').outPath;
            stages = ["pre-commit"];
          };
        };
      };
    });

    devShells = forAllSystems (system: {
      default = nixpkgs.legacyPackages.${system}.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;
        buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;
      };
    });
  };
}
