{ pkgs, lib, spicetify-nix, config, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    spicetify-nix.homeManagerModules.default
  ];
  
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.comfy;

    # Noctalia custom color scheme
    colorScheme = "custom";
    customColorScheme = {
      Comfy = builtins.readFile "/home/gambled/.config/spicetify/Themes/Comfy/color.ini";
    };

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
