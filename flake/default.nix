{ inputs, ... }:
{
  debug = true;

  disabledModules = [ inputs.flake-parts.flakeModules.nixosModules ];
}
