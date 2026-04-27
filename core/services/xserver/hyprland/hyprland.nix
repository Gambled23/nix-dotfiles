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
    # inputs.ambxst.packages.${pkgs.stdenv.hostPlatform.system}.default
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kitty # required for the default Hyprland config
    hyprshot # Screenshot tool
    playerctl
    brightnessctl
    # hyprpolkitagent # Polkit for gui applications
    kdePackages.qtwayland
    libsForQt5.qt5.qtwayland
    pipewire
    pulseaudio
    pulsemeeter
    sof-firmware # audio via hdmi
    wireplumber
    hypridle
    pamixer
    pavucontrol
    kdePackages.qttools # for noctalia kde connect plugin
    ripdrag # for yazi drag plugin
    glib # for yazi gvfs plugin
    bibata-cursors
    iw # for cards layout in hyprlock
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

  services.gnome.evolution-data-server.enable = true;

  # yazi
  services.gvfs.enable = true;

  # Display manager and session
  services.displayManager.defaultSession = "hyprland-uwsm";
  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "gambled";
    ly = {
      enable = true;
    };
  };

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
}
