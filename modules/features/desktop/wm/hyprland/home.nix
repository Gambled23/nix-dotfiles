{ self, inputs, ... }: {
  flake.homeModules.hyprlandHome = { config, pkgs, lib, ... }: {
    imports = [
      self.homeModules.hyprlockCards
      self.homeModules.vicinae
      self.homeModules.noctaliaHome
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      systemd.variables = [ "--all" ];
      configType = "lua";
    };

    xdg.configFile."hypr/hyprland.lua".source =
      config.lib.file.mkOutOfStoreSymlink
      "/etc/nixos/modules/features/wm/hyprland/_lua/hyprland.lua";
    xdg.configFile."hypr/hosts".source =
      config.lib.file.mkOutOfStoreSymlink
      "/etc/nixos/modules/features/wm/hyprland/_lua/hosts";
    xdg.configFile."hypr/configs".source =
      config.lib.file.mkOutOfStoreSymlink
      "/etc/nixos/modules/features/wm/hyprland/_lua/configs";
    xdg.configFile."hypr/rules".source =
      config.lib.file.mkOutOfStoreSymlink
      "/etc/nixos/modules/features/wm/hyprland/_lua/rules";

    xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 
    
    home.file.".config/xdg-desktop-portal/hyprland-portals.conf".text = ''
      [preferred]
      default = hyprland;gtk
      org.freedesktop.impl.portal.FileChooser = kde
    '';
  };
}
