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

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      powerBar
      lastfm
      shuffle
      playNext
      volumePercentage
    ];
  };
}
