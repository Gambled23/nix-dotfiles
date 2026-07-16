{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    enableGitIntegration = true;
    quickAccessTerminalConfig = {
      hide_on_focus_loss = true;
      grab_keyboard = false;
      start_as_hidden = false;
      edge = "bottom";
      background_opacity = 1;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+f" = "search_scrollback";

      # Tabs
      "ctrl+t" = "new_tab_with_cwd";
      "ctrl+shift+[" = "previous_tab";
      "ctrl+shift+]" = "next_tab";
    };
    settings = {
      background_opacity = 0.5;
      confirm_os_window_close = 0;
    };
    extraConfig = ''
      include themes/noctalia.conf
    '';
  };
}