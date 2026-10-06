{ lib
, rustPlatform
, fetchFromGitHub
, fetchzip
, pkg-config
, autoPatchelfHook
, wrapGAppsHook4
, gtk4
, libadwaita
, alsa-lib
, nss
, nspr
, mesa
, libdrm
, libxkbcommon
, xorg
}:

let
  # The AUR package fetches prebuilt CEF binaries directly
  cefVersion = "154.0.34+g14c5a08+chromium-154.0.8037.98";
  cef = fetchzip {
    url = "https://cef-builds.spotifycdn.com/cef_binary_${cefVersion}_linux64_minimal.tar.bz2";
    # Run `nix-prefetch-url --unpack <url>` to get the correct sha256
    hash = "sha256-lczfZhDAbBy2b5wzXoM2VqLl5R51VexjYlLHILPcKFA=";
  };
in
rustPlatform.buildRustPackage rec {
  pname = "karere-custom-css";
  version = "4.2.5";

  src = fetchFromGitHub {
    owner = "riccardomarotti"; # Or the fork maintainer's repository
    repo = "karere";
    rev = "v${version}";
    hash = "sha256-OK5KQH1BaEbbNEOrWZ69oqW2XqWKK/NDg586xcYgQdk=";
  };

  cargoHash = "sha256-E4/cNIXy/7EZUHkYdDOVqnL3G1XYz0z9UG9/NbW11kc=";

  nativeBuildInputs = [
    pkg-config
    autoPatchelfHook
    wrapGAppsHook4
  ];

  buildInputs = [
    gtk4
    libadwaita
    alsa-lib
    nss
    nspr
    mesa
    libdrm
    libxkbcommon
    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrandr
  ];

  # Copy CEF libraries so rustc/cargo and the final binary can find them
  preBuild = ''
    export CEF_PATH="${cef}"
  '';

  postInstall = ''
    # Install CEF shared objects alongside the binary
    mkdir -p $out/lib/karere
    cp -r ${cef}/Release/*$out/lib/karere/
    cp -r ${cef}/Resources/*$out/lib/karere/

    # Ensure binary finds its CEF libraries
    patchelf --add-rpath "$out/lib/karere" $out/bin/karere
  '';

  meta = with lib; {
    description = "Karere with custom CSS reload support";
    homepage = "https://github.com/riccardomarotti/karere";
    license = licenses.gpl3Plus;
    platforms = [ "x86_64-linux" ];
    mainProgram = "karere";
  };
}