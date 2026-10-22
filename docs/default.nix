{
  lib,
  stdenv,
  mdbook,
  nixdoc,
  jq,
  nixosOptionsDoc,
  self,
  pkgs,
  mdbook-pagetoc,
  mdbook-plugins,
  ...
}:
let
  mdbook-treesitter = pkgs.callPackage (
    {
      lib,
      rustPlatform,
      fetchFromGitHub,
    }:
    rustPlatform.buildRustPackage rec {
      pname = "mdbook-treesitter";
      version = "1.1.0";

      src = fetchFromGitHub {
        owner = "Corpauration";
        repo = "mdbook-treesitter";
        rev = "c37bd2316699b96231576ec6d22c9ebf73f782e5";
        hash = "sha256-L4Semc9nWb6m5a/4dm93RdveLDlZvLcshmP7i8q6auk=";
      };

      cargoHash = "sha256-zaJ0eS3QyEJ44T/yoEYwxiP2MFQacS6Uhu18o+CEa+c=";

      meta = {
        description = "mdBook preprocessor adding tree-sitter highlighting support";
        homepage = "https://github.com/Corpauration/mdbook-treesitter";
        license = lib.licenses.mit;
        maintainers = [ ];
        mainProgram = "mdbook-treesitter";
      };
    }
  ) { };

  tree-sitter-nix = pkgs.tree-sitter-grammars.tree-sitter-nix;

  optionsDoc =
    {
      modules ? [ ],
      rev ? "master",
    }:
    let
      eval = lib.evalModules {
        modules = modules ++ [
          {
            _module.check = false;
            _module.args.pkgs = pkgs;
          }
        ];
      };

      optionsDoc = nixosOptionsDoc {
        options.nixowos = eval.options.nixowos;

        transformOptions =
          opt:
          opt
          // {
            declarations = map (
              decl:
              let
                root = self.outPath;
                declStr = toString (lib.filesystem.resolveDefaultNix decl);
                subpath = lib.removePrefix "/" (lib.removePrefix root declStr);
              in
              assert lib.hasPrefix root declStr;
              {
                url = "https://github.com/yunfachi/nixowos/blob/${rev}/${toString subpath}";
                name = subpath;
              }
            ) opt.declarations;
          };
      };
    in
    optionsDoc.optionsCommonMark;
in
stdenv.mkDerivation {
  pname = "nixowos-book";
  version = "0.1.0";

  src = lib.fileset.toSource {
    root = ../.;
    fileset = lib.fileset.unions [
      ./src
      ./theme
      ./book.toml
    ];
  };

  nativeBuildInputs = [
    mdbook
    jq
    mdbook-treesitter
    mdbook-pagetoc
    mdbook-plugins
  ];

  patchPhase = ''
    echo "# NixOS Configuration Options" > docs/src/nixos-configuration-options.md
    cat ${
      optionsDoc { modules = [ self.nixosModules.default ]; }
    } >> docs/src/nixos-configuration-options.md

    echo "# Home Manager Configuration Options" > docs/src/home-manager-configuration-options.md
    cat ${
      optionsDoc { modules = [ self.homeManagerModules.default ]; }
    } >> docs/src/home-manager-configuration-options.md

    mkdir -p docs/treesitter/nix

    cp ${tree-sitter-nix}/parser \
      docs/treesitter/nix.so

    cp ${tree-sitter-nix}/queries/highlights.scm \
      docs/treesitter/nix/highlights.scm

    cp ${tree-sitter-nix}/queries/injections.scm \
      docs/treesitter/nix/injections.scm

    cp ${tree-sitter-nix}/queries/locals.scm \
      docs/treesitter/nix/locals.scm
  '';

  buildPhase = ''
    cd docs
    mdbook build
  '';

  installPhase = ''
    cp -r book $out
  '';
}
