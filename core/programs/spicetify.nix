{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.onepunch;

    enabledCustomApps = with spicePkgs.apps; [
      # newReleases
      
      # marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      # autoSkipVideo
      # bookmark
      fullAppDisplayMod
      # groupSession
      # loopyLoop
      # popupLyrics
      powerBar
      # lastfm
      # shuffle
      # volumePercentage
      # skipOrPlayLikedSongs
      # goToSong
      # showQueueDuration
      # copyToClipboard
      # history
      # savePlaylists
      playingSource
      # sectionMarker
      # beautifulLyrics
      # addToQueueTop
    ];
  };
}
