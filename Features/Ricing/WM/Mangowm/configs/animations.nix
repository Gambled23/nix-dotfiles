{...}:
{
  wayland.windowManager.mango.settings = {
    # Animations - use underscores for multi-part keys
    animations = 1;
    animation_type_open = "slide";
    animation_type_close = "slide";
    animation_duration_open = 400;
    animation_duration_close = 800;
    # Or use nested attrs (will be flattened with underscores)
    animation_curve = {
      open = "0.46,1.0,0.29,1";
      close = "0.08,0.92,0,1";
    };
  };
}