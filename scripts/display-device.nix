{ pkgs }:

pkgs.writeShellScriptBin "display-device" ''
  #!${pkgs.bash}/bin/bash
  echo "Display device script"

  display_name=""
  CONFIG_FILE="$HOME/.config/display-device"

  # -d expects an argument, h is help
  while getopts "hd:ac" opt; do
    case "$opt" in
      h)
        echo "Usage: display-device -d <display_name>"
        echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080p', 'dev-borderless', 'dev-bordermore'"
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
        echo "  dev-borderless"
        echo "  dev-bordermore"
        exit 0
        ;;
      c)
        if [ -f "$CONFIG_FILE" ]; then
          echo "Current display name: $(cat "$CONFIG_FILE")"
        else
          echo "No display name set yet"
        fi
        exit 0
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        echo "Usage: display-device -d <display_name>"
        echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080p', 'dev-borderless', 'dev-bordermore'"
        echo "  -h                  Show this help"
        exit 1
        ;;
    esac
  done

  shift $((OPTIND - 1))

  if [ -z "$display_name" ]; then
    echo "No display name provided." >&2
    echo "Usage: display-device -d <display_name>"
    echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080p', 'dev-borderless', 'dev-bordermore'"
    exit 1
  fi

  # Save display name to file
  mkdir -p "$(dirname "$CONFIG_FILE")"
  echo "$display_name" > "$CONFIG_FILE"

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
    dev-borderless)
      hyprctl keyword monitor "HDMI-A-1, addreserved, 0, 0, 0, 0"
      ;;
    dev-bordermore)
      hyprctl keyword monitor "HDMI-A-1, addreserved, 28, 28, 40, 40"
      ;;
    *)
      echo "Invalid display name: $display_name" >&2
      echo "Usage: display-device -d <display_name>"
      echo "  -d <display_name>   One of 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080p', 'dev-borderless', 'dev-bordermore'"
      echo "  -h                  Show this help"
      exit 1
      ;;
  esac
'' 