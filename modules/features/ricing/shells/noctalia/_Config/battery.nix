{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    battery = {
      warning_threshold = 10;
    };
  };
}
