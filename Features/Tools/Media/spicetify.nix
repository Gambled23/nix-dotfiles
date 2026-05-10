{ pkgs, lib, spicetify-nix, config, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  # myFile = builtins.path {
  #   path = "/home/gambled/.config/spicetify/Themes/Comfy/color.ini";
  #   name = "color.ini";
  # };
in
{
  # home.file.".config/spicetify/Themes/Comfy/noctalia.ini".source = myFile;
  imports = [
    spicetify-nix.homeManagerModules.default
  ];
  
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.comfy;

    # Noctalia custom color scheme
    # colorScheme = "custom";
    # customColorScheme = {
    #   Comfy = myFile;
    # };

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
