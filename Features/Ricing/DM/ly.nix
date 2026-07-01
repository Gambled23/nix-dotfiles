{...}:
{
  # Display manager and session
  services.displayManager.defaultSession = "mango";
  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "gambled";
    ly = {
      enable = true;
    };
  };
}
