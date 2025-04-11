{ pkgs }:

pkgs.writeShellScriptBin "reboot-to-windows" ''
  #!${pkgs.bash}/bin/bash
  windows_title=$(sudo grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
  sudo grub-reboot "$windows_title"
  sudo reboot 
''
