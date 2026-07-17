{
  lib,
  appimageTools,
  fetchurl,
}:

let
  version = "0.1.13-alpha";
  pname = "nuvio";

  src = fetchurl {
    url = "https://github.com/aelrased/NuvioDesktop/releases/download/${version}/Nuvio-${version}-x86_64.AppImage";
    hash = "sha256-CReJh9ydwEMEQxfSX5DBzRuK1GyNgbbUHb4cZ7EJl04=";
  };

  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  extraInstallCommands = ''
    install -m 444 -D "${appimageContents}/nuvio-app.desktop" "$out/share/applications/${pname}.desktop"
    install -m 444 -D "${appimageContents}/nuvio-app.png" "$out/share/icons/hicolor/512x512/apps/${pname}.png"
    substituteInPlace "$out/share/applications/${pname}.desktop" \
      --replace-fail 'Exec=Nuvio/bin/Nuvio' 'Exec=${meta.mainProgram}' \
      --replace-fail 'Icon=nuvio-app' 'Icon=${pname}'
  '';

  meta = {
    description = "Nuvio Desktop App";
    homepage = "https://github.com/aelrased/NuvioDesktop";
    downloadPage = "https://github.com/aelrased/NuvioDesktop/releases";
    license = lib.licenses.gpl3Only;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    maintainers = with lib.maintainers; [ gambled23 ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "nuvio";
  };
}