{ config, lib, pkgs, ... }:

with lib;

{
  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    systemd.restartIfChanged = true;
    enableVPN = true;
    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableClipboardPaste = true;
    enableCalendarEvents = true;
    enableAudioWavelength = true;
    settings = {
      theme = "dark";
      dynamicTheming = true;
    };
  };
}
