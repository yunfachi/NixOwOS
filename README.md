# NwixOwOS

A complete redesign of NixOS into **NwixOwOS**, featuring updated logos, renamed distro, and more.

## Installation (NixOS)

### With Flakes

To enable NwixOwOS, add `inputs.nwixowos` to your Flake and import the NixOS module:

```nix
{
  inputs = {
    nwixowos = {
      url = "github:yunfachi/nwixowos";
      # Optional:
      # inputs.nixpkgs.follows = "nixpkgs";
      # inputs.denix.follows = "denix";
    };
  };

  outputs = { nixpkgs, nwixowos, ... }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          nwixowos.nixosModules.default
          {
            # Enable NwixOwOS
            nwixowos.enable = true;
          }
        ];
      };
    };
}
```

### Without Flakes

Import directly from the Git repository:

```nix
{ pkgs, lib, ... }:
let
  nwixowos = import (builtins.fetchGit {
    url = "https://github.com/yunfachi/nwixowos";
  });
in 
{
  imports = [
    nwixowos.nixosModules.default
  ];

  # Enable NwixOwOS
  nwixowos.enable = true;
}
```

## License

### Project  
Licensed under the [MIT License](./LICENSE).

### Assets  
All files in [`assets/`](./assets/) are licensed under the [Creative Commons Attribution 4.0 International License](./assets/LICENSE).

**Asset credits:**  
- **Base artwork**: Official NixOS logo  
  - Source: https://github.com/NixOS/nixos-artwork/tree/master/logo  
  - License: CC-BY-4.0  
  - Original design by [Simon Frankau](https://arbitrary.name/) (@simon-frankau), revised by [Tim Cuthbertson](https://gfxmonk.net/) (@timbertson)  
- **Modified (uwu style)**: [u/ant-arctica](https://www.reddit.com/user/ant-arctica/)  
  - Reference: https://www.reddit.com/r/linuxmasterrace/comments/lzdwl4/nixowos/  
  - License: CC-BY-4.0  

**Full license texts:**  
- MIT: https://opensource.org/licenses/MIT  
- CC-BY-4.0: https://creativecommons.org/licenses/by/4.0/
