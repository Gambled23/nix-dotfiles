{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    ../home.nix
  ];
  home = {
    username = "gambled";
    homeDirectory = "/home/gambled";
  };
  
  home.packages = with pkgs; [ 
    # books
    #hakuneko
    #kcc
    #calibre
    #mangal

    # dev
    android-studio
    python3
    python311Packages.pip

    # games
    bottles
    steam
    steam-run
    osu-lazer-bin
    prismlauncher
    r2modman
    wineWowPackages.waylandFull

    # media
    stremio

    # media creation
    inkscape-with-extensions
    gimp-with-plugins
    qt6.qtwebsockets
    libsForQt5.kdenlive
    libportal-qt5
    obs-studio
    kdenlive
    jellyfin-ffmpeg

    # messaging 
    whatsapp-for-linux
    telegram-desktop

    # utils
    polychromatic
    balena-etcher
  ];

  #Wake on lan
  networking.interfaces.enp6s0.wakeOnLan.enable = true;
  systemd.services.wakeonlan = {
    description = "Reenable wake on lan every boot";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "simple";
      RemainAfterExit = "true";
      ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp6s0 wol g";
    };
    wantedBy = [ "default.target" ];
  };

  # open razer
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["gambled"];

  programs.dconf.enable = true; # bugs de wayland y gtk

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
  };
}


