{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
}:

buildNpmPackage rec {
  pname = "material-components";
  version = "2.2.1";

  src = fetchFromGitHub {
    owner = "giovannilamarmora";
    repo = "lovelace-material-components";
    rev = "v${version}";
    hash = "sha256-kYaAg5HJGoUpAllzJNYrVITbmZ8txJRoikfLLzyDHJo=";
  };

  npmDepsHash = "sha256-jyw8U99R7M3JJwu30ADefAitm4lWWVHEwq108gWZpfg=";

  preBuild = ''
    rm -rf dist
  '';

  npmBuildScript = "dist";

  installPhase = ''
    runHook preInstall

    cp -rv dist $out

    runHook postInstall
  '';

  meta = {
    changelog = "https://github.com/giovannilamarmora/lovelace-material-components/releases/tag/v${version}";
    description = "Material Home Component is a custom Home Assistant plugin that displays interactive cards for your devices. It shows real-time status (e.g., playing, idle), current media information, and allows quick control like play/pause, volume adjustment, and more — all styled with a modern, dynamic UI.";
    homepage = "https://github.com/giovannilamarmora/lovelace-material-components";
    license = lib.licenses.apache20;
    maintainers = with lib.maintainers; [ gambled23 ];
  };
}