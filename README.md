<p align="center">
  <img src="https://raw.githubusercontent.com/yunfachi/NixOwOS/master/assets/nixowos-snowflake-colours.svg" width="250px" alt="NixOwOS logo">
</p>

A complete redesign of NixOS into **NixOwOS**, featuring updated logos, renamed distro, and more.

## Installation (NixOS)

### With Flakes

To enable NixOwOS, add `inputs.nixowos` to your Flake and import the NixOS module:

```nix
{
  inputs = {
    nixowos = {
      url = "github:yunfachi/nixowos";
      # Optional:
      # inputs.nixpkgs.follows = "nixpkgs";
      # inputs.denix.follows = "denix";
    };
  };

  outputs = { nixpkgs, nixowos, ... }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          nixowos.nixosModules.default
          {
            # Enable NixOwOS
            nixowos.enable = true;
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
  nixowos = import (builtins.fetchGit {
    url = "https://github.com/yunfachi/nixowos";
  });
in 
{
  imports = [
    nixowos.nixosModules.default
  ];

  # Enable NixOwOS
  nixowos.enable = true;
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
