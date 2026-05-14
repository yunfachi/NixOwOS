{
  perSystem =
    { config, ... }:
    {
      devShells.default = config.pre-commit.devShell;
    };
}
