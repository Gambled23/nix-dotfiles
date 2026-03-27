{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    # theme = {
    #   name = lib.mkForce "onepunch";
    # };

    enabledCustomApps = with spicePkgs.apps; [
      # newReleases
      
      # marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      aiBandBlocker
      # autoSkipVideo
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
