{ config, inputs, lib, pkgs, ... }:

with lib;

{
  imports = [
    ./stylix.nix
  ];
  
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };


  environment.systemPackages = with pkgs; [
    kitty # required for the default Hyprland config
    hyprshot # Screenshot tool
    playerctl
    # hyprpolkitagent # Polkit for gui applications
    kdePackages.qtwayland
    libsForQt5.qt5.qtwayland
    pipewire
    pulseaudio
    wireplumber
    waybar
    hyprpaper
    hypridle
    pamixer
    swayosd # On-screen display for volume/brightness changes
  ];

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.menus.enable = true; # For dolphin to show up apps in the open with menu
}
