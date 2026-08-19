{
  stdenvNoCC,
  fetchurl,
  unzip,
  makeWrapper,

  pname,
  version,
  meta,
  passthru,
}:
stdenvNoCC.mkDerivation rec {
  inherit
    pname
    version
    meta
    passthru
    ;

  src = fetchurl {
    url = "https://api.hayase.watch/files/mac-hayase-${version}-mac.dmg";
    hash = "sha256-ckEb4ocJyg55VcYRq+M/OHzz1delswlsDcRmbN3uHoA=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [
    unzip
    makeWrapper
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{bin,Applications}
    cp -r Hayase.app $out/Applications/
    makeWrapper $out/Applications/Hayase.app/Contents/MacOS/Hayase $out/bin/hayase
    runHook postInstall
  '';
}