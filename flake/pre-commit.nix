{ inputs, ... }:
{
  imports = [ inputs.git-hooks-nix.flakeModule ];

  perSystem =
    {
      system,
      pkgs,
      config,
      ...
    }:
    {
      pre-commit.settings = {
        src = ./.;
        hooks = {
          nixfmt-rfc-style.enable = true;

          nixowos-generate-docs = {
            enable = true;
            name = "NixOwOS generate docs";
            files = ".*";
            language = "system";
            entry =
              (pkgs.writeShellScript "nixowos-generate-docs.sh" ''
                cat $(nix build .#packages.${system}.nixowos-nixos-docs --print-out-paths --no-link) > ./nixos-options.md
                cat $(nix build .#packages.${system}.nixowos-home-docs --print-out-paths --no-link) > ./home-options.md
                git add ./nixos-options.md
                git add ./home-options.md
              '').outPath;
            stages = [ "pre-commit" ];
          };
        };
      };

      devShells = {
        default = config.pre-commit.devShell;
      };
    };
}
