{ config, pkgs, lib, ... }:

{
  services.syncthing = {
    enable = true;
    user = "gambled";
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    dataDir = "/home/gambled";  # default location for new folders
    configDir = "/home/gambled/.config/syncthing";

    overrideFolders = false;
    settings.folders = {
      "Documents" = {
        versioning.type = "simple";
        path = "/home/gambled/Documents";
        enable = true;
        devices = [ "pc-gambled" "home-gambled" "steamdeck" "server-gambled" "dev-gambled" ];
      };
      "Pictures" = {
        versioning.type = "simple";
        path = "/home/gambled/Pictures";
        enable = true;
        devices = [ "pc-gambled" "home-gambled" "steamdeck" "server-gambled" "dev-gambled" ];
      };
    };

    settings.devices = {
      "pc-gambled" = {
        id = "DHS6DW3-DCD57N6-EEFGWHJ-DTHW7EW-N6CM5L3-6TMN3XL-W7SG5C2-GT6HDQZ";
        name = "pc-gambled";
        autoAcceptFolders = true;
      };
      "home-gambled" = {
        id = "IJSFZTV-LJ2AHAT-4TZGE56-3CE5EHO-C5AGHH5-VVU5VQE-HQTKIDH-CIUYTAI";
        name = "home-gambled";
        autoAcceptFolders = true;
      };
      "steamdeck" = {
        id = "3ATLG3P-4VXFG3H-G36OP5D-ZHUHWVQ-XMWUTBG-OWOZ2ZC-VSPUJUX-ALSPAQW";
        name = "steamdeck";
        autoAcceptFolders = true;
      };
      "server-gambled" = {
        id = "TK7DIYL-JOCJJ6T-C37SHGV-XXHMXGG-PWWO2TU-7A5SQCO-K5NDN72-T632CAI";
        name = "server-gambled";
        autoAcceptFolders = true;
      };
      "dev-gambled" = {
        id = "SUYWFCG-MFT3UN4-NDBW2VM-LEOZ2UW-WSYDRVV-AGV4MMF-F7P6FDA-QXSQZAF";
        name = "dev-gambled";
        autoAcceptFolders = true;
      };
      "android-gambled" = {
        id = "MBROAJY-UP2QSBY-QI4D74J-WDM6WZR-LBL3NIB-3DL3JOI-6YJOJYD-VISD2QP";
        name = "android-gambled";
        autoAcceptFolders = true;
      };
    };
  };
}
