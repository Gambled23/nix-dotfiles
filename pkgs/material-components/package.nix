{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  fetchPnpmDeps,
  pnpmConfigHook,
  pnpm_10,
  nodejs,
}:
let
  pnpm = pnpm_10;
in
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "material-components";
  version = "2.2.1";

  src = fetchFromGitHub {
    owner = "giovannilamarmora";
    repo = "lovelace-material-components";
    rev = "v${finalAttrs.version}";
    hash = "sha256-CGR//TPl1eOisua9DTlrpu6eY4R4pgTWLd9oPFAx8Xw=";
  };

  pnpmDeps = fetchPnpmDeps {
    inherit (finalAttrs) pname version;
    src = stdenvNoCC.mkDerivation {
      name = "${finalAttrs.pname}-${finalAttrs.version}-src-with-lock";
      src = finalAttrs.src;
      phases = [ "unpackPhase" "patchPhase" "installPhase" ];
      postPatch = ''
        substituteInPlace package.json \
          --replace-fail '"dependencies": {' '"dependencies": {
            "js-yaml": "^4.1.0",
            "tslib": "^2.6.2",'
        cp ${./pnpm-lock.yaml} pnpm-lock.yaml
      '';
      installPhase = ''
        cp -r . $out
      '';
    };
    inherit pnpm;
    fetcherVersion = 3;
    hash = "sha256-N8eBOOMztFqQYyQy40WCjjwDQiqarY0B55Wy8htNae8=";
  };

  nativeBuildInputs = [
    pnpmConfigHook
    pnpm
    nodejs
  ];

  postPatch = ''
    substituteInPlace package.json \
      --replace-fail '"dependencies": {' '"dependencies": {
        "js-yaml": "^4.1.0",
        "tslib": "^2.6.2",'
    cp ${./pnpm-lock.yaml} pnpm-lock.yaml
  '';

  buildPhase = ''
    runHook preBuild

    pnpm run build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p "$out"
    cp dist/* "$out"

    runHook postInstall
  '';

  meta = {
    changelog = "https://github.com/giovannilamarmora/lovelace-material-components/releases/tag/v${finalAttrs.version}";
    description = "Material Home Component is a custom Home Assistant plugin that displays interactive cards for your devices. It shows real-time status (e.g., playing, idle), current media information, and allows quick control like play/pause, volume adjustment, and more — all styled with a modern, dynamic UI.";
    homepage = "https://github.com/giovannilamarmora/lovelace-material-components";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ gambled23 ];
    platforms = lib.platforms.all;
  };
})