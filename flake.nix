{
  description = "Complete redesign of NixOS into NwixOwOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    denix = {
      url = "github:yunfachi/denix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    denix,
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
      default = nwixowos;
      nwixowos = call ./nixos;
    };

    overlays = {
      neofetch = final: prev: call ./overlays/neofetch final prev;
      nixos-icons = final: prev: call ./overlays/nixos-icons final prev;
    };

    legacyPackages = forAllSystems (
      system: let
        callPackage = file: nixpkgs.legacyPackages.${system}.callPackage (_call file {inherit system;}) {};
      in {
        nwixowos-icons = callPackage ./pkgs/nwixowos-icons;
      }
    );
  };
}
