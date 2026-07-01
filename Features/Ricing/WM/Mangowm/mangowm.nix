{inputs, pkgs, ...}:
{
  imports = [
    inputs.mangowm.nixosModules.mango
  ];

  programs.mango = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Clipboard
    cliphist
    wl-clipboard
    wlr-randr
  ];
   
  services.pipewire.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.kdePackages.xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = [ "mangowm;gtk" ];
        # Send settings requests (used by Monique/GTK apps) to the GTK portal
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
        # Use GTK for file choosers too (optional but recommended)
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
  };

  security.pam.services.login.enableGnomeKeyring = true;
  services.dbus.packages = [ pkgs.gcr ];

}