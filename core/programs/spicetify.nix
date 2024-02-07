{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  # install spicetify
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  programs.spicetify = {
    enable = true;
    
    theme = spicePkgs.themes.Onepunch;

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      lyrics-plus
    ];

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      autoSkipVideo
      shuffle
      groupSession
      powerBar
      seekSong
      playlistIcons
      fullAlbumDate
      goToSong
      skipStats
      showQueueDuration
      history
      lastfm
      adblock
      playNext
      volumePercentage
    ];
  };
}