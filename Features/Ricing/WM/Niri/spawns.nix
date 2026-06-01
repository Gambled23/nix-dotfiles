{...}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      { argv = ["noctalia-shell" "-d"]; }
      { argv = ["spotify"]; }
      { argv = ["discord"]; }
      { argv = ["altus"]; }
      { argv = ["kde-connect-indicator"]; }
    ];
  };
}