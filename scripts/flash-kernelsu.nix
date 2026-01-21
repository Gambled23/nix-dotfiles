{ pkgs }:

pkgs.writeShellScriptBin "flash-kernelsu" ''
  #!${pkgs.bash}/bin/bash
  android_kdeconnect_id=add58a14_05d3_43a6_821f_d741a767cf5e
  read -p "init_boot.img route: " init_boot
  kdeconnect-cli --device $android_kdeconnect_id --share $init_boot
  # wait for transfer to complete
  read -p "Press [Enter] key after sending init_boot patched image..."
  adb reboot fastboot
  cd ~/Downloads
  read -p "patched init_boot: " init_boot
  fastboot flash init_boot $init_boot
  fastboot reboot
''