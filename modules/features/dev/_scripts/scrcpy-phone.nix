{ pkgs }:

pkgs.writeShellScriptBin "scrcpy-phone" ''
  #!${pkgs.bash}/bin/bash

  hostname=$(hostname)
  adb_usb_devices=$(adb devices | grep -v "List of devices" | grep -v "offline" | grep -v "unauthorized" | awk '{print $1}')

  case $hostname in
    pc-gambled)
      wireless_bitrate="15M"
    ;;
    dev-gambled)
      wireless_bitrate="3M"
    ;;
  esac

  # USB
  if [ "$adb_usb_devices" ]; then
    scrcpy --render-driver=opengl -S -w -K -b 15M --power-off-on-close --window-title \"phone\" -d
  elif [ -z "$adb_usb_devices" ]; then
    adb connect pixel-9-pro-xl:5555
    scrcpy --render-driver=opengl -S -w -K -b $wireless_bitrate --power-off-on-close --window-title \"phone\" -e
    adb disconnect pixel-9-pro-xl:5555
  fi
''
