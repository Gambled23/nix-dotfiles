{ config, pkgs, lib, ... }:

{
  services.syncthing = {
    enable = true;
    user = "gambled";
    openDefaultPorts = true;
    dataDir = "/home/gambled";  # default location for new folders
    configDir = "/home/gambled/.config/syncthing";

    overrideFolders = false;
    settings.folders = {
      "Desktop"= {
        versioning.type = "simple";
        path = "/home/gambled/Desktop";
      };
      "Documents" = {
        versioning.type = "simple";
        path = "/home/gambled/Documents";
        enable = true;
      };
      "Downloads" = {
        versioning.type = "simple";
        path = "/home/gambled/Downloads";
      };
      "Music" = {
        versioning.type = "simple";
        path = "/home/gambled/Music";
      };
      "Pictures" = {
        versioning.type = "simple";
        path = "/home/gambled/Pictures";
        enable = true;
      };
      "Templates" = {
        versioning.type = "simple";
        path = "/home/gambled/Templates";
      };
      "Videos" = {
        versioning.type = "simple";
        path = "/home/gambled/Videos";
      };
    };

    settings.devices = {
      "pc-gambled" = {
        id = "DHS6DW3-DCD57N6-EEFGWHJ-DTHW7EW-N6CM5L3-6TMN3XL-W7SG5C2-GT6HDQZ";
        name = "pc-gambled";
      };
      "home-gambled" = {
        id = "IJSFZTV-LJ2AHAT-4TZGE56-3CE5EHO-C5AGHH5-VVU5VQE-HQTKIDH-CIUYTAI";
        name = "home-gambled";
      };
      "steamdeck" = {
        id = "3ATLG3P-4VXFG3H-G36OP5D-ZHUHWVQ-XMWUTBG-OWOZ2ZC-VSPUJUX-ALSPAQW";
        name = "steamdeck";
      };
      "server-gambled" = {
        id = "TK7DIYL-JOCJJ6T-C37SHGV-XXHMXGG-PWWO2TU-7A5SQCO-K5NDN72-T632CAI";
        name = "server-gambled";
      };
      "dev-gambled" = {
        id = "SUYWFCG-MFT3UN4-NDBW2VM-LEOZ2UW-WSYDRVV-AGV4MMF-F7P6FDA-QXSQZAF";
        name = "dev-gambled";
      };
    };
  };
}
