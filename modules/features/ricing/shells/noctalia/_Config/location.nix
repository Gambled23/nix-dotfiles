{ pkgs, config, lib, ... }:
{
  programs.noctalia.settings = {
    location = {
      address = "";
      auto_locate = true;
      custom_schedule = false;
      sunrise = "";
      sunset = "";
    };
  };
}
