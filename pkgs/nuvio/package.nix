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
  pname = "nuvio";
  version = "0.1.22-alpha";

  src = fetchurl {
    url = "https://github.com/NuvioMedia/NuvioDesktop/releases/download/${version}/Nuvio-Linux-x86_64-${version}.AppImage";
    hash = "sha256-IEv9BTKjnz88CwYKXGP5/5Qd+tUBn2IIPpUCd7rSmck=";
  };

  extracted = appimageTools.extract {inherit pname version src;};
in
  appimageTools.wrapType2 {
    inherit pname version src;

    nativeBuildInputs = [makeWrapper];

    extraInstallCommands = ''
      install -Dm444 ${extracted}/Nuvio.png $out/share/icons/hicolor/256x256/apps/nuvio.png
      install -Dm444 ${extracted}/Nuvio.desktop $out/share/applications/nuvio.desktop
      substituteInPlace $out/share/applications/nuvio.desktop \
        --replace-fail 'Exec=AppRun' 'Exec=nuvio' \
        --replace-fail 'Icon=Nuvio' 'Icon=nuvio'

      wrapProgram $out/bin/nuvio \
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