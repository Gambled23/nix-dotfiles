{
  appimageTools,
  lib,
  fetchurl,
}:
let
  pname = "moondeckbuddy";
  version = "1.6.3";
  src = fetchurl {
    url = "https://github.com/FrogTheFrog/moondeck-buddy/releases/download/v${version}/MoonDeckBuddy-${version}-x86_64.AppImage";
    hash = "sha256-VbHz9bSob3XSt7ut3jAiSl1/AV+Jw+SOP1mWBI5ggYQ=";
  };
  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/MoonDeckBuddy.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/MoonDeckBuddy.desktop \
      --replace-fail 'Exec=MoonDeckBuddy' 'Exec=MoonDeckBuddy %u'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = {
    description = "A server-side part of the MoonDeck plugin for the SteamDeck.";
    homepage = "https://github.com/FrogTheFrog/moondeck-buddy";
    changelog = "https://github.com/FrogTheFrog/moondeck-buddy/blob/v${version}/CHANGELOG.md";
    license = lib.licenses.gpl3Plus;
    maintainers = [ lib.maintainers.luftmensch-luftmensch ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    mainProgram = "MoonDeckBuddy";
  };
}
