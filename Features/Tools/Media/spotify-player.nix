{...}:{
  programs.spotify-player = {
    enable = true;

    keymaps = [
      {
        command = "{ VolumeChange = { offset = -1 } }";
        key_sequence = "-";
      }
      {
        command = "{ VolumeChange = { offset = 1 } }";
        key_sequence = "=";
      }
      {
        command = "PlayRandom";
        key_sequence = "r";
      }
      {
        command = "SeekForward";
      }
      {
        command = "RefreshPlayback";
        key_sequence = "C-r";
      }
      {
        command = "SeekBackward";
        key_sequence = "left";
      }
      {
        command = "AddSelectedItemToQueue";
        key_sequence = "z";
      }
      {
        command = "Queue";
        key_sequence = "Z C-z";
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
  };
}