{ config, pkgs, ... }:

{
  home.file.".config/i3/config".text = ''
  exec_always nitrogen --restore
  '';
}
