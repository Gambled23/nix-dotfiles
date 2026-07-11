{inputs, pkgs, ...}:
{
  imports = [
    inputs.mangowm.nixosModules.mango
  ];

  programs.mango = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Monitors
    wlr-randr
  ];
   
  services.pipewire.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;
  services.dbus.packages = [ pkgs.gcr ];

  xdg.portal = {
    enable = true;
    config.mango = {
      default = ["gtk"];
      "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      "org.freedesktop.impl.portal.ScreenCast" = ["wlr"];
      "org.freedesktop.impl.portal.ScreenShot" = ["wlr"];
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    wlr.enable = true;
  };
}