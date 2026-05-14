{
  description = "Complete redesign of NixOS into NixOwOS";

  inputs = {
    nixpkgs.url = "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    denix.url = "github:yunfachi/denix/rewrite";

    systems.url = "github:nix-systems/default";

    git-hooks.url = "github:cachix/git-hooks.nix";

    nuschtos-search.url = "github:NuschtOS/search";
    nuschtos-search.inputs.nixpkgs.follows = "nixpkgs";

    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake
      {
        inherit inputs;
        specialArgs.root = ./.;
      }
      (
        { root, ... }:
        {
          imports = inputs.denix.lib.umport {
            path = root + "/flake";
          };
        }
      );
}
