{ config, pkgs, lib, ... }:

{
  boot = {
    # Plymouth
    consoleLogLevel = 0;
    initrd.verbose = false;
    plymouth.enable = true;

    supportedFilesystems = [ "ntfs" ];
    loader = { 
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        efiInstallAsRemovable = true;
        timeoutStyle = "menu";
      };
    };
  };

  console =
  {
    font = "ter-132n";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  # TTY
  fonts.fonts = with pkgs; [ meslo-lgs-nf ];
  services.kmscon =
  {
    enable = true;
    hwRender = true;
    extraConfig =
    ''
      font-name=MesloLGS NF
      font-size=14
    '';
  };
}
