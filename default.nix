{
  nixosModules = rec {
    nixowos = builtins.warn ''
      `(import (builtins.fetchGit "https://github.com/yunfachi/nixowos")).nixosModules.default` is deprecated, use this instead:
      {
        imports = [
          "''${builtins.fetchGit { url = "https://github.com/yunfachi/nixowos"; }}/nixos"
        ];
      }
    '' ./nixos;
    default = nixowos;
  };
  homeModules = rec {
    nixowos = builtins.warn ''
      `(import (builtins.fetchGit "https://github.com/yunfachi/nixowos")).homeModules.default` is deprecated, use this instead:
      {
        imports = [
          "''${builtins.fetchGit { url = "https://github.com/yunfachi/nixowos"; }}/home-manager"
        ];
      }
    '' ./home-manager;
    default = nixowos;
  };
}
