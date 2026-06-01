{...}:
{
  programs.niri.settings = {
    window-rules = [
      {
        draw-border-with-background = false;
        geometry-corner-radius =
          let
            r = 8.0;
          in
          {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };
        clip-to-geometry = true;
      }
      {
        opacity = 0.6;
        matches = [
          {
            title = "ripdrag";
          }
        ];
      }
    ];
  };
}