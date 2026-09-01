{ self, inputs, ... }: {
  flake.homeModules.kitty = { config, pkgs, ... }: {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      enableGitIntegration = true;
      quickAccessTerminalConfig = {
        hide_on_focus_loss = true;
        grab_keyboard = true;
        start_as_hidden = false;
        edge = "bottom";
        lines = 20;
        background_opacity = 1;
      };
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 14;
      };
      keybindings = {
        "ctrl+a" = "select_all";
        "ctrl+c" = "copy_or_interrupt";
        "ctrl+v" = "paste_from_clipboard";
        "ctrl+f" = "search_scrollback";
        "ctrl+backspace" = "send_text all \\x17";
        "ctrl+left" = "send_text all \\x1b\\x62";
        "ctrl+right" = "send_text all \\x1b\\x66";

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
  };
}
