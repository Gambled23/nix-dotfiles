{inputs, pkgs, ...}:
let 
  terminal = "ghostty";
in
{
  programs.niri.settings = {
    input = {
      mod-key = "Super";
      mod-key-nested = "Alt";
      mouse = {
        enable = true;
        accel-profile = "flat";
      };
    };
    binds = {
      # Apps
      "Mod+Return".action.spawn = terminal;
      "Mod+Shift+E".action.spawn = "nautilus";
      "Mod+E".action.spawn-sh = terminal + " -e yazi";
      "Mod+R".action.spawn-sh = "vicinae toggle";
      "Mod+M".action.spawn-sh = "noctalia-shell ipc call lockScreen lock";
      "Mod+O".action.spawn-sh = "moonlight stream 'el sunchine' 'dev-gambled'";
      "Mod+P".action.spawn-sh = "scrcpy --render-driver=opengl -S -w -K -b15M --power-off-on-close";
      "Mod+C".action.spawn = "code";
      "Mod+F".action.spawn-sh = "google-chrome-stable --ozone-platform-wayland --disable-features=GlobalShortcutsPortal";
      "Mod+V".action.spawn = [terminal "-e" "vim"];
      "Mod+Escape".action.spawn = [terminal "-e" "btop"];
      
      # System Utils
      "Mod+W".action.toggle-overview = { };
      "Mod+Shift+Space".action.show-hotkey-overlay = { };
      "Mod+Q".action.close-window = { };
      "Mod+S".action.expand-column-to-available-width = { };
      "Mod+Shift+S".action.maximize-column = { };
      "Print".action.screenshot = { };
      "F11".action.fullscreen-window = { };

      # Window Management
      "Mod+X".action.toggle-window-floating = { };

      "Mod+H".action.focus-column-or-monitor-left = { };
      "Mod+J".action.focus-window-or-workspace-down = { };
      "Mod+K".action.focus-window-or-workspace-up = { };
      "Mod+L".action.focus-column-or-monitor-right = { };

      "Mod+Shift+H".action.move-column-left-or-to-monitor-left = { };
      "Mod+Shift+J".action.move-window-down-or-to-workspace-down = { };
      "Mod+Shift+K".action.move-window-up-or-to-workspace-up = { };
      "Mod+Shift+L".action.move-column-right-or-to-monitor-right = { };

      "Mod+Shift+M".action.quit.skip-confirmation = true;
    };
  };
}