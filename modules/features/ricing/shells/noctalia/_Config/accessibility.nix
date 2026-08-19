{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    accessibility = {
      high_contrast = false;
      ui_scale = 1.0;
    };
  };
}
