{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    keybinds = {
      cancel = [ "Escape" ];
      copy = [ "Ctrl+c" ];
      delete = [ "Delete" ];
      down = [ "Down" ];
      left = [ "Left" ];
      right = [ "Right" ];
      save = [ "Ctrl+s" ];
      tab_next = [ "Tab" ];
      tab_previous = [ "Shift+ISO_Left_Tab" ];
      up = [ "Up" ];
      validate = [ "Return" "KP_Enter" "space" ];
    };
  };
}
