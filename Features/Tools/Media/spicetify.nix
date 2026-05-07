{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.comfy;

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      betterLibrary
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      # addToQueueTop
      beautifulLyrics
      # bookmark
      # copyToClipboard
      # goToSong
      # groupSession
      # history
      # lastfm
      loopyLoop
      playNext
      # popupLyrics
      # powerBar
      # savePlaylists
      # sectionMarker
      # skipOrPlayLikedSongs
      # showQueueDuration
      # shuffle
      volumePercentage
    ];

    wayland = true;
    windowManagerPatch = true;
  };
}
