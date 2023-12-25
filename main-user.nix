{
  lib, config, pkgs, ...
}: 
let 
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";
    userName = lib.mkOption {
      default = "gambled";
      description = ''username'';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "mainuser";
      initialPassword = "password";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}