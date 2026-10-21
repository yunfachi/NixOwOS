{
  inputs = {
    nixowos.url = "path:../.";
    nixpkgs.follows = "nixowos/nixpkgs";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Logic will be written in a separate file.
  outputs = _: { };
}
