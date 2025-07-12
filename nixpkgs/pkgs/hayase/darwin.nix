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
    url = "https://github.com/hayase-app/ui/releases/download/v${version}/mac-hayase-${version}-mac.zip";
    hash = "sha256-V4Vo9fuQ0X7Q6CBM7Akh3+MrgQOBgCuC41khFatYWi4=";
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