{
  perSystem =
    { pkgs, ... }:
    {
      pre-commit.settings = {
        package = pkgs.prek;

        hooks = {
          nixfmt = {
            enable = true;

            settings = {
              width = 140;
              indent = 2;
            };
          };

          deadnix = {
            enable = true;

            settings = {
              edit = true;
            };
          };

          statix = {
            enable = true;

            settings = {
              ignore = [ "/flake.nix" ];
            };
          };

          keep-sorted.enable = true;
        };
      };
    };
}
