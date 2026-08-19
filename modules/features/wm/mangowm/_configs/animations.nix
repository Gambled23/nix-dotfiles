{...}:
{
  wayland.windowManager.mango.settings = {
    # Animations - use underscores for multi-part keys
    animations = 1;
    layer_animations = 1;

    # animation_type_open = "fade";
    # animation_type_close = "fade";
    # animation_duration_open = 400;
    # animation_duration_close = 400;
    # animation_fade_in = 1;
    # animation_fade_out = 1;
    # fadein_begin_opacity = 0.5;
    # fadeout_begin_opacity = 0.5;

    # Or use nested attrs (will be flattened with underscores)
    # animation_curve = {
    #   open = "0.46,1.0,0.29,1";
    #   close = "0.08,0.92,0,1";
    # };

    animation_fade_in = 1;
    animation_fade_out = 1;

    # Animation Type (Available types: slide, zoom, fade, none.)
    animation_type_open = "zoom";
    animation_type_close = "zoom";
    layer_animation_type_open = "slide";
    layer_animation_type_close = "slide";

    # Fade Settings
    fadein_begin_opacity = 1.0;
    fadeout_begin_opacity = 1.0;

    # Zoom Settings
    zoom_initial_ratio = 0.6;
    zoom_end_ratio = 0.6;

    # Durations (in milliseconds)
    animation_duration_move = 400;
    animation_duration_open = 400;
    animation_duration_tag = 700;
    animation_duration_close = 400;
    animation_duration_focus = 0;

    # Bezier curves
    animation_curve_open = "0.05,0.7,0.1,1";
    animation_curve_move = "0.40,1.0,0.06,1.0";
    animation_curve_tag = "0.1,1,0,1";
    animation_curve_close = "0.05,0.7,0.1,1";
    animation_curve_focus = "0.46,1.0,0.29,0.99";
    animation_curve_opafadein = "0.05,0.7,0.1,1";
    animation_curve_opafadeout = "0.05,0.7,0.1,1";

    # Tag Animation Direction (1: horizontal, 0: vertical)
    tag_animation_direction = 1;
  };
}