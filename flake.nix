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

  outputs =
    {
      nixpkgs,
      denix,
      pre-commit-hooks,
      self,
      ...
    }:
    let
      _call =
        file: extraArgs:
        import file (
          {
            inherit self;
            inherit (nixpkgs) lib;
            delib = denix.lib;
            root = ./.;
            assets = ./assets;
          }
          // extraArgs
        );
      call = file: _call file { };

      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      nixosModules = rec {
        default = nixowos;
        nixowos = call ./nixos;
      };

      homeModules = rec {
        default = nixowos;
        nixowos = call ./home;
      };

      homeManagerModules = nixpkgs.lib.warn "nixowos: flake output `homeManagerModules` has been renamed to `homeModules`." self.homeModules;

      overlays = {
        fastfetch = final: prev: call ./overlays/fastfetch final prev;
        hyfetch = final: prev: call ./overlays/hyfetch final prev;
        neofetch = final: prev: call ./overlays/neofetch final prev;
        nitch = final: prev: call ./overlays/nitch final prev;
        nixos-icons = final: prev: call ./overlays/nixos-icons final prev;
      };

      legacyPackages = forAllSystems (
        system:
        let
          callPackage = file: nixpkgs.legacyPackages.${system}.callPackage (_call file { inherit system; });
        in
        {
          catgirldownloader = callPackage ./pkgs/catgirldownloader { };
          nixowos-icons = callPackage ./pkgs/nixowos-icons { };
          nixowos-nixos-docs = callPackage ./pkgs/nixowos-docs { moduleSystem = "nixos"; };
          nixowos-home-docs = callPackage ./pkgs/nixowos-docs { moduleSystem = "home"; };
        }
      );

      checks = forAllSystems (system: {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixfmt-rfc-style.enable = true;

            nixowos-generate-docs = {
              enable = true;
              name = "NixOwOS generate docs";
              files = ".*";
              language = "system";
              entry =
                (nixpkgs.legacyPackages.${system}.writeShellScript "nixowos-generate-docs.sh" ''
                  cat $(nix build .#legacyPackages.${system}.nixowos-nixos-docs --print-out-paths --no-link) > ./nixos/README.md
                  cat $(nix build .#legacyPackages.${system}.nixowos-home-docs --print-out-paths --no-link) > ./home/README.md
                  git add ./nixos/README.md
                  git add ./home/README.md
                '').outPath;
              stages = [ "pre-commit" ];
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
