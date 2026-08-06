{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    widget = {
      active_window = {
        enabled = true;
        font_weight = 200;
        icon_size = 14.0;
        max_length = 200;
        min_length = 0;
        title_scroll = "on_hover";
        type = "active_window";
      };
      bar_2 = {
        type = "icefish/phone-connect:bar";
      };
      battery = {
        hide_when_full = true;
        hide_when_plugged = true;
        type = "battery";
      };
      btn = {
        type = "ezequiel/mango_layouts:btn";
      };
      cat = {
        type = "dotnetrob/cat:cat";
      };
      control-center = {
        capsule = true;
        capsule_radius = 8;
        type = "control-center";
      };
      cpu = {
        stat = "cpu_usage";
        type = "sysmon";
      };
      date = {
        format = "{:%a %d %b}";
        type = "clock";
      };
      hello = {
        type = "noctalia/example:hello";
      };
      input_volume = {
        device = "input";
        type = "volume";
      };
      keybinds = {
        type = "kenn/keybind-cheatsheet:keybinds";
      };
      keyboard_layout = {
        hide_when_single_layout = false;
        type = "keyboard_layout";
      };
      lock_keys = {
        display = "short";
        hide_when_off = false;
        show_caps_lock = true;
        show_num_lock = true;
        show_scroll_lock = false;
        type = "lock_keys";
      };
      mangowm-keymode = {
        hide_on_default = true;
        show_text = true;
        type = "gambled23/mangowm-keymode:mangowm-keymode";
      };
      media = {
        anchor = true;
        art_size = 16.0;
        max_length = 300;
        min_length = 0;
        title_scroll = "on_hover";
        type = "media";
      };
      network_rx = {
        stat = "net_rx";
        type = "sysmon";
      };
      network_tx = {
        stat = "net_tx";
        type = "sysmon";
      };
      nix_monitor_2 = {
        show_text = false;
        type = "avivbintangaringga/nix-monitor:nix-monitor";
      };
      notes = {
        type = "noctalia/notes:notes";
      };
      notifications = {
        hide_when_no_unread = true;
        type = "notifications";
      };
      output_volume = {
        device = "output";
        type = "volume";
      };
      privacy = {
        hide_inactive = true;
        type = "privacy";
      };
      ram = {
        stat = "ram_used";
        type = "sysmon";
      };
      spacer = {
        interactive = false;
        type = "spacer";
      };
      status = {
        type = "pozzoo/hassio:status";
      };
      temp = {
        stat = "ram_pct";
        type = "sysmon";
      };
      tracker = {
        type = "cleboost/anilist:tracker";
      };
      tray = {
        capsule = true;
        drawer = true;
        type = "tray";
      };
      vicinae = {
        capsule = true;
        capsule_padding = 3.0;
        enabled = true;
        glyph = "rocket";
        type = "custom_button";
        actions = {
          left = "exec vicinae toggle";
          right = "exec vicinae toggle";
        };
      };
      volume = {
        capsule = true;
        type = "volume";
        actions = {
          scroll_down = "volume-down 1%";
          scroll_up = "volume-up 1%";
        };
      };
      widget = {
        type = "alexander/screen-toolkit:widget";
      };
      workspaces = {
        capsule = true;
        empty_color = "secondary";
        occupied_color = "tertiary";
        style = "minimal";
        type = "workspaces";
      };
    };
  };
}
