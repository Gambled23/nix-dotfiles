{ pkgs }:

pkgs.writeShellScriptBin "display-device" ''
  #!${pkgs.bash}/bin/bash
  echo "Display device script"

  display_name=""
  CONFIG_FILE="$HOME/.config/display-device"

  # -d expects an argument, h is help, r is restore
  while getopts "hd:acr" opt; do
    case "$opt" in
      h)
        echo "Usage: display-device [options]"
        echo "  -d <display_name>   Switch to: 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080-169'"
        echo "  -r                  Restore display configuration from saved state"
        echo "  -c                  Show current display configuration"
        echo "  -a                  List available display configurations"
        echo "  -h                  Show this help"
        exit 0
        ;;
      d)
        display_name="$OPTARG"
        ;;
    esac
  done

  shift $((OPTIND - 1))

  if [ -z "$display_name" ]; then
    echo "No display name provided." >&2
    echo "Usage: display-device [options]" >&2
    echo "  -d <display_name>   Switch to: 'pc-gambled', 'steamdeck', 'dev-gambled', 'android-gambled', '1080-169'" >&2
    exit 1
  fi

  case "$display_name" in
    steamdeck)
      steam steam://open/bigpicture
      monique --switch-profile "steamdeck"
      # hyprctl eval "
      # hl.monitor({
      #     output = \"sunshine\",
      #     mode = \"1280x800@60\",
      #     position = \"0x0\",
      #     scale = \"1\",
      #     disabled = false,
      # })

      # hl.monitor({
      #     output = \"DP-3\",
      #     disabled = true,
      # })"
      ;;
    pc-gambled)
      monique --switch-profile "pc-gambled"
      # hyprctl eval "
      # hl.monitor({
      #     output = \"DP-3\",
      #     mode = \"3440x1440@180\",
      #     position = \"0x0\",
      #     scale = \"1\",
      #     disabled = false,
      # })

      # hl.monitor({
      #     output = \"sunshine\",
      #     disabled = true,
      # })"
      ;;
    dev-gambled)
      monique --switch-profile "dev-gambled"
      # hyprctl eval "
      # hl.monitor({
      #     output = \"sunshine\",
      #     mode = \"1920x1200@60\",
      #     position = \"0x0\",
      #     scale = \"1\",
      #     disabled = false,
      # })

      # hl.monitor({
      #     output = \"DP-3\",
      #     disabled = true,
      # })"
      ;;
    1080-169)
      monique --switch-profile "1080-169"
      # hyprctl eval "
      # hl.monitor({
      #     output = \"sunshine\",
      #     mode = \"1920x1080@60\",
      #     position = \"0x0\",
      #     scale = \"1\",
      #     disabled = false,
      # })

      # hl.monitor({
      #     output = \"DP-3\",
      #     disabled = true,
      # })"
      ;;
    android-gambled)
      steam steam://open/bigpicture
      monique --switch-profile "android-gambled"
      # hyprctl eval "
      # hl.monitor({
      #     output = \"sunshine\",
      #     mode = \"2992x1344@120\",
      #     position = \"0x0\",
      #     scale = \"1\",
      #     disabled = false,
      # })

      # hl.monitor({
      #     output = \"DP-3\",
      #     disabled = true,
      # })"
      ;;
    *)
      echo "Invalid display name: $display_name" >&2
      echo "Usage: display-device -d <display_name>"
      echo "  -h                  Show this help"
      exit 1
      ;;
  esac
'' 
