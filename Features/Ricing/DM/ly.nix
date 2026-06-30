{...}:
{
  # Display manager and session
  services.displayManager.defaultSession = "hyprland-uwsm";
  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "gambled";
    ly = {
      enable = true;
    };
  };
}
