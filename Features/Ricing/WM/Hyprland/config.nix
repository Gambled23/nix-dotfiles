# Home manager file
{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: 
{
  imports = [
    # Services and programs
    # ../../hyprsunset.nix
    # ../../hypridle.nix
    ../../../Tools/Media/hyprshot.nix
    ../../Hyprlock/cards.nix
    ../../../Tools/vicinae.nix

    # Hyprland settings
    # ./animations.nix
    # ./binds.nix
    # ./rules.nix
    # ./input.nix
    # ./plugins.nix
    # ./look_and_feel.nix

    # Shells
    # ../../Shells/noctalia_v4.nix
    # ../../Shells/noctalia_v5.nix
    ../../Shells/dankmaterialshell.nix
  ];

  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    systemd.variables = ["--all"]; # To pass environment variables to the systemd services started by Hyprland
    configType = "lua";
  };

  xdg.configFile."hypr/hyprland.lua".source =
    config.lib.file.mkOutOfStoreSymlink
    "/etc/nixos/Features/Ricing/WM/Hyprland/lua/hyprland.lua";
  xdg.configFile."hypr/hosts".source =
    config.lib.file.mkOutOfStoreSymlink
    "/etc/nixos/Features/Ricing/WM/Hyprland/lua/hosts";
  xdg.configFile."hypr/configs".source =
    config.lib.file.mkOutOfStoreSymlink
    "/etc/nixos/Features/Ricing/WM/Hyprland/lua/configs";
  xdg.configFile."hypr/rules".source =
    config.lib.file.mkOutOfStoreSymlink
    "/etc/nixos/Features/Ricing/WM/Hyprland/lua/rules";

  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 
  
  # Using the KDE File Picker With XDPH
  home.file.".config/xdg-desktop-portal/hyprland-portals.conf".text = ''
    [preferred]
    default = hyprland;gtk
    org.freedesktop.impl.portal.FileChooser = kde
  '';
}
