{ ... }:
{
  lib,
  stdenv,
  fetchFromGitHub,
  python3,
  glib,
  gtk4,
  libadwaita,
  gobject-introspection,
  wrapGAppsHook,
  meson,
  ninja,
  pkg-config,
  gettext,
  desktop-file-utils,
}:
python3.pkgs.buildPythonApplication rec {
  pname = "catgirldownloader";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "NyarchLinux";
    repo = "CatgirlDownloader";
    rev = version;
    sha256 = "sha256-EGnxa8PY1B5ZJa+0RAGE0x4yB1eU666yBZfnOeG7rxA=";
  };

  pyproject = false;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    desktop-file-utils
    gettext
    gobject-introspection
    wrapGAppsHook
  ];

  buildInputs = [
    #glib
    gtk4
    libadwaita
  ];

  propagatedBuildInputs = with python3.pkgs; [
    pygobject3
    requests
  ];

  doCheck = false;

  meta = {
    description = "GTK4 application that downloads images of catgirls from nekos.moe";
    homepage = "https://github.com/NyarchLinux/CatgirlDownloader";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintaners; [ yunfachi ];
    platforms = lib.platforms.all;
  };
}
