{inputs, pkgs, ...}:
let 
  terminal = "ghostty";
  web_browser = "google-chrome-stable";
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
      "Mod+Return".action.spawn = terminal;
      "Mod+E".action.spawn = [terminal "-e" "yazi"];
      "Mod+Shift+E".action.spawn = "nautilus";
      "Mod+R".action.spawn = ["vicinae" " toggle"];
      "Mod+F".action.spawn = web_browser;
      "Mod+Q".action.close-window = { };
      "Mod+V".action.spawn = [terminal "-e" "vim"];
      "Print".action.screenshot = { };

      "Mod+Shift+M".action.quit.skip-confirmation = true;
    };
  };
}