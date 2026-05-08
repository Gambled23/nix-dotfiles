{ config, lib, pkgs, ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      truecolor = false;
      theme_background = false;
      vim_keys = true;
    };
  };
}
