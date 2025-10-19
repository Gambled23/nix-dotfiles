{ pkgs }:

pkgs.writeShellScriptBin "display-device" ''
  #!${pkgs.bash}/bin/bash

  # Parse options
  while getopts "u" opt; do
    case $opt in
      h)
        echo "Usage: display [-d] [display_name]"
        echo "  -d                Set display to specified display_name"
        echo "  display_name     One of 'pc-gambled', 'steamdeck'"
        exit 0
        ;;
      d)
        if [ $2 ]; then
          display_name=$2
          case $display_name in
            pc-gambled)
              kscreen-doctor output.DP-3.mode.3440x1440@180
              ;;
            steamdeck)
              kscreen-doctor output.DP-3.mode.1280x800@60
              ;;
            *)
              echo "Invalid display name: $display_name"
              exit 1
              ;;
          esac
        fi
      ;;
      *)
        echo "Invalid option: -$opt"
        exit 1
        ;;
    esac
  done
''
