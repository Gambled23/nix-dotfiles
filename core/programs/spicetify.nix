{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
  # install spicetify
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # programs.spicetify = {
  #   enable = true;
    
  #   theme = spicePkgs.themes.catppuccin;
  #   colorScheme = "mocha";

  #   enabledCustomApps = with spicePkgs.apps; [
  #     newReleases
  #     marketplace
  #     lyrics-plus
  #   ];

  #   enabledExtensions = with spicePkgs.extensions; [
  #     powerBar
  #     lastfm
  #     shuffle
  #     playNext
  #     volumePercentage
  #   ];
  # };
}