{ config, pkgs, lib, ... }:

{
  services.paperless = {
    enable = true;
    domain = "0.0.0.0";
    port = 28981;
    exporter.enable = true;
    exporter.onCalendar = "00:00:00";
    database.createLocally = true;
  };
}
