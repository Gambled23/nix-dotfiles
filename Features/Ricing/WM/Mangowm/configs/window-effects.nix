{...}:
{
  wayland.windowManager.mango.settings = {
    gappih = 2;
    gappiv = 2;
    gappoh = 4;
    gappov = 4;
    tab_bar_height = 20; # Height of the tab bar for monocle layout.

    blur = 1;
    blur_optimized = 0;
    blur_layer=1;
    blur_params = {
      radius = 5;
      num_passes = 2;
      noise=0.02;
      brightness=0.9;
      contrast=0.9;
      saturation=1;
    };

    border_radius = 8;

    shadows=1;
    layer_shadows=1;
    shadow_only_floating=1;
    shadows_size=12;
    shadows_blur=15;
    shadows_position_x=0;
    shadows_position_y=0;

    borderpx=1;

    focused_opacity = 1.0;
  };
}