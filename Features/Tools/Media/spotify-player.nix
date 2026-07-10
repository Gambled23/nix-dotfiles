{...}:{
  programs.spotify-player = {
    enable = true;

    keymaps = [
      {
        command = {
          VolumeChange = { 
            offset = -1;
          };
        };
        key_sequence = "-";
      }
      {
        command = {
          VolumeChange = {
            offset = 1;
          };
        };
        key_sequence = "=";
      }
      {
        command = "PlayRandom";
        key_sequence = "r";
      }
      {
        command = "RefreshPlayback";
        key_sequence = "C-r";
      }
      {
        command = {
          SeekForward = { };
        };
        key_sequence = "right";
      }
      {
        command = {
          SeekBackward = { };
        };
        key_sequence = "left";
      }
      {
        command = "AddSelectedItemToQueue";
        key_sequence = "z";
      }
      {
        command = "Queue";
        key_sequence = "Z";
      }
    ];

    # Actions are keymaps that targets the selected item by default but can be configured with target set to PlayingTrack or SelectedItem
    actions = [
      {
        action = "GoToArtist";
        key_sequence = "g A";
        target = "PlayingTrack";
      }
      {
        action = "GoToAlbum";
        key_sequence = "g B";
        target = "PlayingTrack";
      }
      {
        action = "ToggleLiked";
        key_sequence = "C-l";
      }
    ];

    settings = {
      theme = "default";
      enable_relative_line_number = true;
      client_port = 8080;
      login_redirect_uri = "http://127.0.0.1:8989/login";
      playback_format = ''
        {status} {track} • {artists} {liked}
        {album}
        {metadata}
      '';
      playback_metadata_fields = [ "repeat" "shuffle" "volume" "device" ];
      notify_timeout_in_secs = 5;
      notify_transient = true;
      tracks_playback_limit = 50;
      app_refresh_duration_in_ms = 32;
      playback_refresh_duration_in_ms = 0;
      page_size_in_rows = 40;
      play_icon = "▶";
      pause_icon = "▌▌";
      liked_icon = "♥";
      explicit_icon = "(E)";
      border_type = "Rounded";
      progress_bar_type = "Rectangle";
      progress_bar_position = "Right";
      genre_num = 1;
      cover_img_length = 10;
      cover_img_width = 5;
      cover_img_scale = 1.0;
      enable_media_control = true;
      enable_streaming = "Always";
      enable_audio_visualization = false;
      enable_notify = true;
      enable_cover_image_cache = true;
      default_device = "spotify-player";
      notify_streaming_only = false;
      seek_duration_secs = 10;
      sort_artist_albums_by_type = false;
      volume_scroll_step = 5;
      enable_mouse_scroll_volume = true;
      notify_format = {
        summary = "{track} • {artists}";
        body = "{album}";
      };
      layout = {
        playback_window_position = "Top";
        playback_window_height = 4;
        library = {
          playlist_percent = 50;
          album_percent = 30;
        };
      };
      device = {
        name = "spotify-player";
        device_type = "speaker";
        volume = 100;
        bitrate = 320;
        audio_cache = true;
        normalization = true;
        autoplay = false;
      };
    };
  };
}