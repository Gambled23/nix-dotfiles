{...}:{
  programs.noctalia.settings = {
    widget = {
			active_window = {
				icon_size = 14.0;
				max_length = 200;
				min_length = 0;
				title_scroll = "on_hover";
				type = "active_window";
			};
			battery = {
				hide_when_full = true;
				hide_when_plugged = true;
				type = "battery";
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
			keyboard_layout = {
				cycle_command = "";
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
			media = {
				anchor = true;
				art_size = 16.0;
				max_length = 800;
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
			notes = {
				type = "noctalia/notes:notes";
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
				type = "spacer";
			};
			temp = {
				stat = "ram_pct";
				type = "sysmon";
			};
			tray = {
				capsule = true;
				drawer = true;
				type = "tray";
			};
			vicinae = {
				capsule = true;
				capsule_padding = 3.0;
				command = "vicinae toggle";
				glyph = "rocket";
				right_command = "vicinae toggle";
				type = "custom_button";
			};
			volume = {
				capsule = true;
				scroll_step = 1;
				type = "volume";
			};
			workspaces = {
				capsule = true;
				empty_color = "tertiary";
				minimal = true;
				type = "workspaces";
			};
		};
  };
}