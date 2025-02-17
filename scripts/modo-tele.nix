{ pkgs }:

pkgs.writeShellScriptBin "modo-tele" ''
  #!${pkgs.bash}/bin/bash

  if [ $1 == 'enable' ]; then
    kscreen-doctor output.HDMI-A-2.enable
    ${pkgs.killall}/bin/killall -q steam
    while pgrep steam > /dev/null; do sleep 1; done
    start-gamescope-session
  fi

  if [ $1 == 'disable' ]; then
    kscreen-doctor output.HDMI-A-2.disable
    ${pkgs.killall}/bin/killall -q steam
    while pgrep steam > /dev/null; do sleep 1; done
    steam
  fi

  if [ "$2" == '-audio' ]; then
    current_device=$(pactl info | grep "Default Sink")
    if [[ $current_device == *"SteelSeries"* ]]; then
      pactl set-default-sink alsa_output.pci-0000_0a_00.1.hdmi-stereo
    else
      pactl set-default-sink alsa_output.usb-SteelSeries_Arctis_7_-00.analog-stereo
    fi
  fi
''
