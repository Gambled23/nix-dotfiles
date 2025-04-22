{ pkgs }:

pkgs.writeShellScriptBin "modo-tele" ''
  #!${pkgs.bash}/bin/bash

  if [ $1 == 'enable' ]; then
    kscreen-doctor output.DP-1.disable output.HDMI-A-1.enable
  fi

  if [ $1 == 'disable' ]; then
    kscreen-doctor output.DP-1.enable output.HDMI-A-1.disable
  fi

  if [ "$2" == '-audio' ]; then
    current_device=$(pactl info | grep "Default Sink")
    if [[ $current_device == *"Logitech"* ]]; then
      pactl set-default-sink alsa_output.pci-0000_0a_00.1.hdmi-stereo
    else
      pactl set-default-sink alsa_output.usb-Logitech_PRO_X_Wireless_Gaming_Headset-00.analog-stereo
    fi
  fi
''
