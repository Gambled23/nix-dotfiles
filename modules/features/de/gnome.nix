{ self, inputs, ... }: {
  flake.nixosModules.gnome = { pkgs, ... }: {
    services.libinput.enable = true;
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    environment.systemPackages = with pkgs; [
      fluent-icon-theme
      gnome-extension-manager
      gnome-backgrounds
      gnome-maps
      gnome-music
      gnome-tweaks
      papirus-icon-theme
      gnome-user-docs
      gnome-video-effects
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.hide-universal-access
      gnomeExtensions.bluetooth-quick-connect
      gnomeExtensions.caffeine
      gnomeExtensions.forge
      gnomeExtensions.gsconnect
      gnomeExtensions.just-perfection
      gnomeExtensions.night-theme-switcher
      gnomeExtensions.one-thing
      gnomeExtensions.pano
      gnomeExtensions.pip-on-top
      gnomeExtensions.run-or-raise
      gnomeExtensions.unblank
      gnomeExtensions.vitals
      wmctrl
    ];

    services.udev.packages = with pkgs; [ gnome-settings-daemon ];
  };
}
