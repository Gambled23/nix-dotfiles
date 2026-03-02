{ pkgs }:

pkgs.writeShellScriptBin "display-device" ''
  #!${pkgs.bash}/bin/bash
  echo "Display device script"

  display_name=""

  # -d expects an argument, h is help
  while getopts "hd:ac" opt; do
    case "$opt" in
      h)
        echo "Usage: display-device -d <display_name>"
        echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080p'"
        echo "  -h                  Show this help"
        exit 0
        ;;
      d)
        display_name="$OPTARG"
        ;;
      a)
        echo "  pc-gambled"
        echo "  steamdeck"
        echo "  dev-gambled"
        echo "  android-gambled"
        echo "  1080p"
        exit 0
        ;;
      c)
        echo "Current display name: $display_name"
        exit 0
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        echo "Usage: display-device -d <display_name>"
        echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080p'"
        echo "  -h                  Show this help"
        exit 1
        ;;
    esac
  done

  shift $((OPTIND - 1))

  if [ -z "$display_name" ]; then
    echo "No display name provided." >&2
    echo "Usage: display-device -d <display_name>"
    echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080p'"
    exit 1
  fi

  case "$display_name" in
    steamdeck)
      hyprctl dispatch workspace 8
      steam steam://open/bigpicture
      hyprctl keyword monitor "sunshine,1280x800@60,0x0,1"
      hyprctl keyword monitor "DP-3, disable"
      ;;
    pc-gambled)
      hyprctl keyword monitor "DP-3,3440x1440@180,0x0,1"
      hyprctl keyword monitor "sunshine, disable"
      ;;
    dev-gambled)
      hyprctl keyword monitor "sunshine,1920x1200@60,0x0,1"
      hyprctl keyword monitor "DP-3, disable"
      ;;
    android-gambled)
      hyprctl dispatch workspace 8
      steam steam://open/bigpicture
      hyprctl keyword monitor "sunshine,2992x1344@120,0x0,1"
      hyprctl keyword monitor "DP-3, disable"
      ;;
    1080p)
      hyprctl keyword monitor "sunshine,1920x1080@60,0x0,1"
      hyprctl keyword monitor "DP-3, disable"
      ;;
    *)
      echo "Invalid display name: $display_name" >&2
      echo "Usage: display-device -d <display_name>"
      echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080p'"
      echo "  -h                  Show this help"
      exit 1
      ;;
  esac
'' 