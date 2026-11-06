{ self, inputs, config, lib, pkgs, ... }:
{
  flake.homeModules.dux = { pkgs, ... }:
  let
    duxSettings = import ./_Settings.nix;
  in
  {
    imports = [
      inputs.dms.homeModules.dank-material-shell
      inputs.dms-plugin-registry.nixosModules.default
    ];

    programs.dank-material-shell = {
      enable = true;
      systemd.enable = true;
      systemd.restartIfChanged = true;
      enableVPN = true;
      enableSystemMonitoring = true;
      enableDynamicTheming = true;
      enableClipboardPaste = true;
      enableCalendarEvents = true;
      enableAudioWavelength = true;
      settings = lib.mkForce duxSettings;

      plugins = {
        volumeMixer.enable = true;
        usbManager.enable = true;
        discordVoice.enable = true;
        amdGpuMonitor.enable = true;
        mediaPlayer.enable = true;
        # ssshMonitor.enable = true;
        # dankDesktopWeather.enable = true;
      };
    };

    home.packages = with pkgs; [
      adw-gtk3
    ];
  };
}
