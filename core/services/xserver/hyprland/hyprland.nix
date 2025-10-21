{ config, inputs, lib, pkgs, ... }:

with lib;

{
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland.enable = true; # enable Hyprland
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  programs.hyprland.portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

  environment.systemPackages = [
    pkgs.kitty # required for the default Hyprland config
    pkgs.wofi # App launcher
    pkgs.grim # Screenshot tool
    pkgs.playerctl
    pkgs.hyprpolkitagent # Polkit for gui applications
    pkgs.kdePackages.qtwayland
    pkgs.libsForQt5.qt5.qtwayland
    pkgs.dunst # notification daemon
    pkgs.pipewire
    pkgs.wireplumber
  ];

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
