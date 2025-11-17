{ config, inputs, lib, pkgs, ... }:

with lib;

{
  imports = [
    ./stylix.nix
  ];
  
  nix.settings = {
    # cache for hyprland packages
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    # cache for walker menu
    extra-substituters = ["https://walker.cachix.org" "https://walker-git.cachix.org"];
    extra-trusted-public-keys = ["walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM=" "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="];
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
    clipse # Clipboard manager
    playerctl
    # hyprpolkitagent # Polkit for gui applications
    kdePackages.qtwayland
    libsForQt5.qt5.qtwayland
    pipewire
    pulseaudio
    pulsemeeter
    wireplumber
    waybar
    hyprpaper
    hypridle
    pamixer
  ];

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.menus.enable = true; # For dolphin to show up apps in the open with menu

  # Icons for hyprpanel and others
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
  ];
}
