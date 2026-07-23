{ pkgs }:

pkgs.writeShellScriptBin "scrcpy-desktop-mode" ''
  #!${pkgs.bash}/bin/bash
  adb shell settings put global overlay_display_devices 1920x1080/170
  DISPLAY_ID=$(scrcpy --list-displays 2>&1 | grep -o -e '--display-id=[0-9]*' | tail -n 1 | cut -d= -f2)
  scrcpy --display-id "$DISPLAY_ID" --mouse=uhid --keyboard=uhid --render-driver=opengl -S -b10M --power-off-on-close
  adb shell settings put global overlay_display_devices none
''