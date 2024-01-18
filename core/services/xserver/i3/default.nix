{ config, lib, pkgs, ... }: 
let 
  mod = "Mod4";
in
{
  imports = [
    ./picom.nix
  ];
  
  services.xserver.windowManager.i3 = {
    enable = true;
  };
 
  #services.xserver.displayManager.defaultSession = "none+i3";

  environment.systemPackages = with pkgs; [
    xorg.xmodmap
    # autostart stuff
    dex
    brightnessctl
    pavucontrol
    lightlocker
    lxappearance
    scrot
    evince
    rofi
    gnome.eog
    libnotify
    dunst
    pamixer
    mpc_cli
    clipit
    picom
    xclip
    xorg.xev
    xorg.xprop
    (i3pystatus.override {
      extraLibs = with python3.pkgs; [ keyrings-alt paho-mqtt ];
    })
    networkmanagerapplet
    gnome.file-roller
    gnome.nautilus
  ];

  security.polkit.enable = true; # polkit security service
  services.gvfs.enable = true; #gnome virtual file system
  services.autorandr.enable = true;
  programs.nm-applet.enable = true;
}
