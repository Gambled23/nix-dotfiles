{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
  # install spicetify
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  programs.spicetify = {
    enable = true;
    # theme = spicePkgs.themes.lucid;

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      autoSkipVideo
      bookmark
      fullAppDisplayMod
      groupSession
      loopyLoop
      popupLyrics
      powerBar
      lastfm
      shuffle
      volumePercentage
      skipOrPlayLikedSongs
      goToSong
      showQueueDuration
      copyToClipboard
      history
      savePlaylists
      playingSource
      sectionMarker
      beautifulLyrics
      addToQueueTop
    ];
  };
}
