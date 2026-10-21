{
  description = "Complete redesign of NixOS into NixOwOS";

  inputs = {
    nixpkgs.url = "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      systems = lib.systems.flakeExposed;
      eachSystem = f: lib.genAttrs systems (system: f system nixpkgs.legacyPackages.${system});

      devFlake =
        (import (builtins.fetchurl {
          url = "https://raw.githubusercontent.com/NixOS/flake-compat/f275e157c50c3a9a682b4c9b4aa4db7a4cd3b5f2/default.nix";
          sha256 = "sha256:0nycwx0777d451k63ghp6p5lcv791kziqgkvqzmr1qwzywkdk1cj";
        }) { src = ./dev; }).defaultNix;

      devOutputs = devFlake.inputs.flake-parts.lib.mkFlake {
        inputs = devFlake.inputs // {
          nixowos = self;
          self = devFlake;
        };
      } ./dev/config.nix;
    in
    {
      inherit (devOutputs) checks formatter;

      packages = eachSystem (_: pkgs: import ./packages { inherit pkgs; });

      overlays = import ./overlays { inherit (self) packages; };

      nixosModules = {
        default = self.nixosModules.nixowos;
        nixowos = ./nixos;
      };

      homeModules = {
        default = self.homeModules.nixowos;
        nixowos = ./home;
      };
    };
}
