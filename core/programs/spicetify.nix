{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = {
      name = "comfy";

      src = pkgs.fetchFromGitHub {
        owner = "Comfy-Themes";
        repo = "Spicetify";
        rev = "32ff101e27cfd33d85b7cc587f7f95db6b2df8b0";
        hash = "sha256-sqvmSXJMLE2in/cB8ZIJE/t4J5D0PKRddWECdYJjgX0=";
      };
    };

    enabledCustomApps = with spicePkgs.apps; [
      # newReleases
      
      # marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      aiBandBlocker
      # addToQueueTop
      beautifulLyrics
      # bookmark
      # copyToClipboard
      coverAmbience
      # goToSong
      # groupSession
      # history
      # lastfm
      loopyLoop
      madeForYouShortcut
      playingSource
      playNext
      # popupLyrics
      # powerBar
      # savePlaylists
      sectionMarker
      # skipOrPlayLikedSongs
      # showQueueDuration
      # shuffle
      volumePercentage
    ];

    wayland = true;
    windowManagerPatch = true;
  };
}
