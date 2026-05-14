{
  inputs,
  config,
  self,
  ...
}:
{
  imports = [ inputs.denix.flakeModule ];

  denix = {
    imports = [ (inputs.denix.lib.moduleSystem "home" { }) ];
    myconfigPrefix = null;
  };

  denixSettings = {
    generateSystems = false;
    generateModules = false;
  };

  flake = {
    nixosModules = {
      default = self.nixosModules.nixowos;
      nixowos = config.denixConfiguration.genModule {
        moduleSystem = "nixos";
      };
    };

    homeModules = {
      default = self.homeModules.nixowos;
      nixowos = config.denixConfiguration.genModule {
        moduleSystem = "home";
      };
    };
  };
}
