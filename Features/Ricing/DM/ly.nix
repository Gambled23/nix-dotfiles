{...}:
{
  # Display manager and session
  # services.displayManager.defaultSession = "hyprland-uwsm";
  services.displayManager.defaultSession = "mango";
  services.displayManager = {
    autoLogin.enable = false;
    autoLogin.user = "gambled";
    ly = {
      enable = true;
    };
    # plasma-login-manager.enable = true;
  };
}