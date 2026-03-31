{ inputs, ... }:
{
  imports = [ inputs.git-hooks-nix.flakeModule ];

  perSystem =
    { config, ... }:
    {
      pre-commit.settings = {
        src = ./.;
        hooks = {
          nixfmt-rfc-style.enable = true;
        };
      };

      devShells = {
        default = config.pre-commit.devShell;
      };
    };
}
