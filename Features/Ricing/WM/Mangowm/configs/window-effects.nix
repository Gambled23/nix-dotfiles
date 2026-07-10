{...}:
{
  wayland.windowManager.mango.settings = {
    gappih = 2;
    gappiv = 2;
    gappoh = 4;
    gappov = 4;
    tab_bar_height = 20; # Height of the tab bar for monocle layout.

    blur = 1;
    blur_layer=1;
    blur_optimized = 0;
    blur_params = {
      num_passes = 2;
      radius = 5;
      noise=0.03;
      brightness=0.9;
      contrast=0.9;
      saturation=1;
    };

    # layer_animations=0;

    border_radius = 8;

    shadows=0;
    layer_shadows=0;
    shadow_only_floating=1;
    shadows_size=8;
    shadows_blur=12;
    shadows_position_x=1;
    shadows_position_y=1;
    shadowscolor="0x000000ff";

    borderpx=1;

    focused_opacity = 1.0;
  };
}