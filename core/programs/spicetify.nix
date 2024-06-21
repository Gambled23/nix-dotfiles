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
    
    theme = spicePkgs.themes.Sleek;

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      lyrics-plus
    ];

    enabledExtensions = with spicePkgs.extensions; [
      powerBar
      lastfm
      fullAppDisplay
      autoSkipVideo
      shuffle
      groupSession
      seekSong
      playlistIcons
      fullAlbumDate
      goToSong
      adblock
      playNext
      volumePercentage
    ];
  };
}