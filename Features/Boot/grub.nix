{ config, pkgs, lib, ... }:

{
  boot = {
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];
    tmp.useTmpfs = false;
    kernelPackages = pkgs.linuxPackages_latest;
    extraModprobeConfig = '' options bluetooth disable_ertm=1 '';

    # Plymouth
    consoleLogLevel = 0;
    initrd.verbose = false;
    plymouth.enable = true;

    supportedFilesystems = [ "ntfs" ];
    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
    };
  };

  # console =
  # {
  #   font = "ter-132n";
  #   packages = with pkgs; [ terminus_font ];
  #   keyMap = "us";
  # };

  # # TTY
  # # fonts.fonts = with pkgs; [ meslo-lgs-nf ];
  # services.kmscon =
  # {
  #   enable = true;
  #   hwRender = true;
  #   extraConfig =
  #   ''
  #     font-name=MesloLGS NF
  #     font-size=14
  #   '';
  # };
}
