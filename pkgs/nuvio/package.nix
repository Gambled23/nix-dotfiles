{
  appimageTools,
  cairo,
  fetchurl,
  glib,
  gtk3,
  lib,
  libX11,
  libXcomposite,
  makeWrapper,
  mpv,
  stdenv,
  webkitgtk_4_1,
}: let
  pname = "nuvio-custom";
  version = "0.1.34-alpha";

  src = fetchurl {
    url = "https://github.com/NuvioMedia/NuvioDesktop/releases/download/${version}/Nuvio-Linux-x86_64-${version}.AppImage";
    hash = "sha256-Im/6fFa+RnvTN2VROVGruXX5sXOtiPHi3g7T82DBB+0==";
  };

  extracted = appimageTools.extract {inherit pname version src;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    nativeBuildInputs = [makeWrapper];

    extraInstallCommands = ''
      install -Dm444 ${extracted}/Nuvio.png $out/share/icons/hicolor/256x256/apps/nuvio.png
      install -Dm444 ${extracted}/Nuvio.desktop $out/share/applications/nuvio-custom.desktop
      substituteInPlace $out/share/applications/nuvio-custom.desktop \
        --replace-fail 'Exec=AppRun' 'Exec=nuvio-custom' \
        --replace-fail 'Icon=Nuvio' 'Icon=nuvio'

      wrapProgram $out/bin/nuvio-custom \
        --set _JAVA_AWT_WM_NONREPARENTING 1 \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [
          cairo
          glib
          gtk3
          libX11
          libXcomposite
          mpv
          stdenv.cc.cc
          webkitgtk_4_1
        ]}
    '';

    meta = {
      description = "Nuvio media streaming desktop client";
      homepage = "https://github.com/NuvioMedia/NuvioDesktop";
      license = lib.licenses.gpl3Only;
      platforms = lib.platforms.linux;
      mainProgram = "nuvio";
    };
  }
