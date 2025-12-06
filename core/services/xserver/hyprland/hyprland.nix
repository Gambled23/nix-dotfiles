{ config, inputs, lib, pkgs, ... }:

with lib;

{
  imports = [
    ./stylix.nix
  ];
    
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
    pulsemeeter
    sof-firmware # audio via hdmi
    wireplumber
    # waybar
    hyprpaper
    waytrogen
    hypridle
    pamixer
  ];

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.menus.enable = true; # For dolphin to show up apps in the open with menu

  # Icons for hyprpanel and others
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono
    texlivePackages.alfaslabone
  ];

  #hyprlock
  security.pam.services.hyprlock = {};
}
