{ self, inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:
    {
      packages.nixowos-documentation = inputs.nuschtos-search.packages.${system}.mkMultiSearch {
        baseHref = "/";
        title = "NixOwOS Search";

        # TODO: https://github.com/NuschtOS/search/issues/244
        scopes = [
          {
            name = "NixOS Module";
            modules = [ self.nixosModules.default ];
            urlPrefix = "https://github.com/yunfachi/NixOwOS/blob/master/";
          }
          {
            name = "Home Manager Module";
            modules = [ self.homeModules.default ];
            urlPrefix = "https://github.com/yunfachi/NixOwOS/blob/master/";
          }
        ];
      };
    };
}
