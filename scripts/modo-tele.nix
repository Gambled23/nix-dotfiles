{ pkgs }:

pkgs.writeShellScriptBin "modo-tele" ''
  #!${pkgs.bash}/bin/bash
  current_device=$(pactl info | grep "Default Sink")
  if [[ $current_device == *"Razer"* ]]; then
    pactl set-default-sink alsa_output.pci-0000_0a_00.1.hdmi-stereo
    ${pkgs.killall}/bin/killall steam
    steam -bigpicture
  else
    pactl set-default-sink alsa_output.usb-Razer_Razer_Kraken_Ultimate_00000000-00.analog-stereo
    ${pkgs.killall}/bin/killall steam
    steam
  fi
''


