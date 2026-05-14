{
  perSystem =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      formatter =
        let
          cfg = config.pre-commit.settings;
        in
        # https://github.com/cachix/git-hooks.nix/blob/580633fa3fe5fc0379905986543fd7495481913d/modules/pre-commit.nix#L110
        pkgs.writeShellScriptBin "pre-commit-run" ''
          ${lib.getExe cfg.package} run -c ${cfg.configFile} --all-files
        '';
    };
}
