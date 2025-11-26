{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    # theme = spicePkgs.themes.onepunch;

    enabledCustomApps = with spicePkgs.apps; [
      # newReleases
      
      # marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      # autoSkipVideo
      addToQueueTop
      # beautifulLyrics
      # bookmark
      # copyToClipboard
      # fullAppDisplayMod
      # goToSong
      # groupSession
      # history
      # lastfm
      loopyLoop
      # playingSource
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
