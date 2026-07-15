{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    backdrop = {
      blur_intensity = 0.5;
      enabled = false;
      tint_intensity = 0.30000001192092896;
    };
  };
}
