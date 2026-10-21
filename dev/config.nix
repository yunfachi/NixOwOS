{ lib, ... }: {
  debug = true;

  systems = lib.systems.flakeExposed;

  imports = [
    ./parts/treefmt.nix
  ];
}
