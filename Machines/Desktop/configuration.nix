{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [
    # Window Manager
    # ../../Features/Ricing/WM/Hyprland/hyprland.nix
    # ../../Features/Ricing/WM/Niri/niri.nix
    ../../Features/Ricing/WM/Mangowm/mangowm.nix

    #Display Manager
    ../../Features/Ricing/DM/ly.nix
    # ../../Features/Ricing/DM/noctalia-greeter.nix
  ];

  environment.systemPackages = with pkgs; [
    # Scripts
    (import ../../Scripts/flash-kernelsu.nix { inherit pkgs; })
    
    # Clipboard
    cliphist
    wl-clipboard

    # Libs?
    playerctl
    brightnessctl
    pavucontrol
    ddcutil
    kdePackages.qtwebsockets
    kdePackages.qt6ct
    kdePackages.qtwayland
    qt5.qtwayland
    pipewire
    pulseaudio
    pulsemeeter
    wireplumber
    sof-firmware # audio via hdmi

    # Secrets
    sops
    age

    # Tools
    gnome-calendar
    gnome-contacts
    qalculate-gtk
    nautilus
    gparted

    # Theming
    bibata-cursors
    papirus-icon-theme
    
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  
  services.libinput.enable = true; # Enable touchpad support
  services.flatpak.enable = true; # Enable flatpak
  services.printing.enable = true; # Enable CUPS to print documents.

  # amdgpu
  # boot.initrd.kernelModules = [ "amdgpu"]; //this makes initrd 30mb bigger
  services.xserver.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [gamemode];
    extraPackages32 = with pkgs; [gamemode];
  };
  hardware.amdgpu.initrd.enable = true;
  services.xserver.videoDrivers = ["modesetting"];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  nixpkgs.config.android_sdk.accept_license = true;

  programs.kdeconnect.enable = true;
  
  # Miracast
  networking.firewall = {
    trustedInterfaces = [ "p2p-wl+" ];
    allowedTCPPorts = [ 7236 7250 ];
    allowedUDPPorts = [ 7236 5353 ];
  };

  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 16*1024;
  } ];

  # Virtualisation
  # virtualisation.vmware.host.enable = true; # vmware

  # Launch scrcpy audio when Pixel 9 Pro XL is connected via USB
  systemd.user.services.phone-scrcpy = {
    description = "Launch scrcpy audio on Pixel connected";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.writeShellScript "launch-scrcpy" ''
        ${pkgs.android-tools}/bin/adb wait-for-device
        ${pkgs.scrcpy}/bin/scrcpy --no-video --no-control --serial=45221FDAS003GN --window-title "audio"
      ''}";
      Restart = "no";
    };
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4ee7", ATTR{serial}=="45221FDAS003GN", TAG+="systemd", ENV{SYSTEMD_USER_WANTS}+="phone-scrcpy.service"
  '';
}
