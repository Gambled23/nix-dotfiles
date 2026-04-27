{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = {
      name = "text";
      src = pkgs.fetchFromGitHub {
        owner = "spicetify";
        repo = "spicetify-themes";
        tag = "2.6.0";
        hash = "sha256-qii6iRU7ZaHTT8DuRwhSt8y/K/41ElltLZvmc/1dRpQ=";
      };
    };

    enabledCustomApps = with spicePkgs.apps; [
      # newReleases
      
      # marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      aiBandBlocker
      autoSkipVideo
      # addToQueueTop
      beautifulLyrics
      betterGenres
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
