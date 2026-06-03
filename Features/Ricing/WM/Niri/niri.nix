{inputs, pkgs, ...}:
{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];

  # programs.uwsm.enable = true;
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;
}