{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    battery = {
      warning_threshold = 10;
      device = {
        "/org/freedesktop/UPower/devices/headset_dev_84_AC_60_94_B5_52" = {
          warning_threshold = 20;
        };
      };
    };
  };
}
