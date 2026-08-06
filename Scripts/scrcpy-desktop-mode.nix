{ pkgs }:

pkgs.writeShellScriptBin "scrcpy-desktop-mode" ''
  #!${pkgs.bash}/bin/bash
  hostname=$(hostname)
  case $hostname in
    pc-gambled)
      adb shell settings put global overlay_display_devices 3440x1440/280
    ;;
    dev-gambled)
      adb shell settings put global overlay_display_devices 1920x1080/170
    ;;
  esac
  
  DISPLAY_ID=$(scrcpy --list-displays 2>&1 | grep -o -e '--display-id=[0-9]*' | tail -n 1 | cut -d= -f2)
  scrcpy --display-id "$DISPLAY_ID" --window-title "desktop" --mouse=uhid --keyboard=uhid --render-driver=opengl -S -b10M --power-off-on-close
  adb shell settings put global overlay_display_devices none
''