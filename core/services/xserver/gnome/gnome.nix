{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "gnome";
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    fluent-icon-theme
    gnome-extension-manager
    gnome.adwaita-icon-theme
    gnome.gnome-backgrounds
    gnome.gnome-maps
    gnome.gnome-music
    gnome.gnome-tweaks # Choose either gnome.gnome-tweaks or gnome3.gnome-tweaks  
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.hide-universal-access
    papirus-icon-theme
    pkgs.gnome-user-docs
    pkgs.gnome-video-effects
    pkgs.gnome.gnome-tweaks
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.bluetooth-quick-connect
    pkgs.gnomeExtensions.caffeine
    pkgs.gnomeExtensions.forge
    pkgs.gnomeExtensions.gsconnect
    pkgs.gnomeExtensions.google-earth-wallpaper
    pkgs.gnomeExtensions.just-perfection
    pkgs.gnomeExtensions.night-theme-switcher
    pkgs.gnomeExtensions.one-thing
    pkgs.gnomeExtensions.pano
    pkgs.gnomeExtensions.pip-on-top
    pkgs.gnomeExtensions.run-or-raise
    pkgs.gnomeExtensions.unblank
    pkgs.gnomeExtensions.vitals
    wmctrl

  ];



  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
