{...}:
{
  wayland.windowManager.mango.settings = {
    # Animations - use underscores for multi-part keys
    animations = 1;
    layer_animations = 1;
    animation_type_open = "fade";
    animation_type_close = "fade";
    animation_duration_open = 400;
    animation_duration_close = 400;
    animation_fade_in = 1;
    animation_fade_out = 1;
    fadein_begin_opacity = 0.5;
    fadeout_begin_opacity = 0.5;

    # Or use nested attrs (will be flattened with underscores)
    # animation_curve = {
    #   open = "0.46,1.0,0.29,1";
    #   close = "0.08,0.92,0,1";
    # };
  };
}