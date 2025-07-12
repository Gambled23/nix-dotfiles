{
  fetchurl,
  appimageTools,

  pname,
  version,
  meta,
  passthru,
}:

appimageTools.wrapType2 rec {
  inherit
    pname
    version
    meta
    passthru
    ;

  src = fetchurl {
    url = "https://github.com/hayase-app/ui/releases/download/v${version}/linux-hayase-${version}-linux.AppImage";
    name = "${pname}-${version}.AppImage";
    hash = "sha256-eVkUQswNRBndEyaF9c7mDCrdaf5K7SSgf8LLL4lir3Y=";
  };

  extraInstallCommands =
    let
      contents = appimageTools.extractType2 { inherit pname version src; };
    in
    ''
      mkdir -p "$out/share/applications"
      mkdir -p "$out/share/lib/hayase"
      cp -r ${contents}/{locales,resources} "$out/share/lib/hayase"
      cp -r ${contents}/usr/* "$out"
      cp "${contents}/${pname}.desktop" "$out/share/applications/"
      substituteInPlace $out/share/applications/${pname}.desktop --replace 'Exec=AppRun' 'Exec=${pname}'
    '';
}