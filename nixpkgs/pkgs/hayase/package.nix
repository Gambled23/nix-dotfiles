{
  stdenv,
  lib,
  callPackage,
}:
let
  pname = "hayase";
  version = "6.4.13";
  meta = {
    description = "Stream anime torrents, real-time with no waiting for downloads";
    homepage = "https://hayase.watch/";
    license = lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [
      d4ilyrun
      matteopacini
    ];
    mainProgram = "hayase";

    platforms = [ "x86_64-linux" ] ++ lib.platforms.darwin;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    longDescription = ''
      A pure JS BitTorrent streaming environment, with a built-in list manager.
      Imagine qBit + Taiga + MPV, all in a single package, but streamed real-time.
      Completely ad free with no tracking/data collection.

      This app is meant to feel look, work and perform like a streaming website/app,
      while providing all the advantages of torrenting, like file downloads,
      higher download speeds, better video quality and quicker releases.

      Unlike qBit's sequential, seeking into undownloaded data will prioritise downloading that data,
      instead of flat out closing MPV.
    '';
  };
  passthru = {
    updateScript = ./update.sh;
  };
in
if stdenv.hostPlatform.isDarwin then
  callPackage ./darwin.nix {
    inherit
      pname
      version
      meta
      passthru
      ;
  }
else
  callPackage ./linux.nix {
    inherit
      pname
      version
      meta
      passthru
      ;
  }