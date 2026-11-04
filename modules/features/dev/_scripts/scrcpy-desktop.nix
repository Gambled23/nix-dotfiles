{ pkgs }:

pkgs.writeShellScriptBin "scrcpy-desktop" ''
  #!${pkgs.bash}/bin/bash

  hostname=$(hostname)
  adb_usb_devices=$(adb devices | grep -v "List of devices" | grep -v "offline" | grep -v "unauthorized" | awk '{print $1}')

  if [ -z "$adb_usb_devices" ]; then
    adb connect pixel-9-pro-xl:5555
  fi

  case $hostname in
    pc-gambled)
      adb shell settings put global overlay_display_devices 3440x1440/280
      wireless_bitrate="15M"
    ;;
    dev-gambled)
      adb shell settings put global overlay_display_devices 1920x1080/170
      wireless_bitrate="3M"
    ;;
  esac
  
  DISPLAY_ID=$(scrcpy --list-displays 2>&1 | grep -o -e '--display-id=[0-9]*' | tail -n 1 | cut -d= -f2)

  if [ "$adb_usb_devices" ]; then
    scrcpy --display-id "$DISPLAY_ID" --window-title "desktop" --mouse=uhid --keyboard=uhid --render-driver=opengl -b 15M --power-off-on-close -d
  elif [ -z "$adb_usb_devices" ]; then
    scrcpy --display-id "$DISPLAY_ID" --window-title "desktop" --mouse=uhid --keyboard=uhid --render-driver=opengl -b $wireless_bitrate --power-off-on-close -e
  fi

  adb shell settings put global overlay_display_devices none

  if [ -z "$adb_usb_devices" ]; then
    adb disconnect pixel-9-pro-xl:5555
  fi
''
