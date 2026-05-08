{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../../Features/Tools/ghostty.nix
    ../../Features/Tools/Media/spicetify.nix
    ../../Features/Gaming/nixcord.nix
  ];

}
