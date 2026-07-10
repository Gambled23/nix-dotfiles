{ config, inputs, lib, pkgs, ... }:

with lib;

{
  imports = [
    inputs.monique.nixosModules.default
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    # inputs.ambxst.packages.${pkgs.stdenv.hostPlatform.system}.default

    #Tools
    kitty # required for the default Hyprland config
    # hyprpolkitagent # Polkit for gui applications

    # Dependencies
    kdePackages.qttools # for noctalia kde connect plugin
    # iw # for cards layout in hyprlock
  ];

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # xdg.menus.enable = true; # For dolphin to show up apps in the open with menu
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #     pkgs.kdePackages.xdg-desktop-portal-kde
  #   ];
  #   config = {
  #     common = {
  #       # default = [ "hyprland;gtk" ];
  #       # Send settings requests (used by Monique/GTK apps) to the GTK portal
  #       "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
  #       # Use GTK for file choosers too (optional but recommended)
  #       "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
  #     };
  #   };
  # };

  # Icons for hyprpanel and others
  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.jetbrains-mono
    texlivePackages.alfaslabone
  ]; 

  #hyprlock
  security.pam.services.hyprlock = {};

  # yazi
  services.gvfs.enable = true;

  services.xserver = {
    dpi = 98;
    enable = true;
    exportConfiguration = true;

    # keyboard layout
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  programs.kdeconnect.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPorts = [
      # Moonlight
      5353
      47998
      47999
      48000
      48002
      48010
      # Miracast
      7236
      5353
    ];
    allowedTCPPorts = [
      # MoonDeck Buddy
      59999
      # Moonlight
      47984
      47989
      48010
      # Miracast
      7236
      7250
    ];
  };

  # gnome online accounts
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.evolution-data-server.enable = true;
}
