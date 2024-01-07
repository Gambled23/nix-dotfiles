# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, outputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # mysql
      ./core/services/mysql/mysql.nix
      # openssh
      ./core/services/openssh/default.nix
      # zerotier
      ./core/services/zerotier/zerotier.nix
      
      # Select DE
      ./core/services/xserver/kde/kde.nix
      # ./core/services/xserver/cinnamon/cinnamon.nix
      # ./core/services/xserver/gnome/gnome.nix
      # ./core/services/xserver/hyperland/hyperland.nix
      # ./core/services/xserver/i3/i3.nix
      # ./core/services/xserver/sway/sway.nix 
    ];

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  networking.hostName = "pc-gambled"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  networking.extraHosts =
  ''
    192.168.1.1 router
    192.168.1.12 home-gambled
    10.243.0.4 pc-gambled
    10.243.0.4 laptop-gambled
    159.54.130.222 nisha

  '';

  # bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings.General.Experimental = true; # enables experimental features

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  #Enable gnome desktop manager.
  # services.xserver.displayManager.gdm.enable = true;
  #  services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.displayManager.defaultSession = "gnome";
  

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # nix auto gc delete old generations
  nix = {
    gc = {
      automatic = true; 
      dates = "weekly"; 
      options = "--delete-older-than 7d";
    };
  };
  # optimise store
  nix.settings.auto-optimise-store = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];



  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # nixos-scripts
    (import ./scripts/auto-pull.nix { inherit pkgs; })
    (import ./scripts/auto-push.nix { inherit pkgs; })
    (import ./scripts/auto-gc.nix { inherit pkgs; })
    lazygit
  ];
  
  # Autoupgrade packages
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gambled = {
    isNormalUser = true;
    description = "César Girón";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    packages = with pkgs; [ ];
  };
  # symlinks for store packages
  environment.etc."spotify".source = "${pkgs.spotify}";
  # adb
  programs.adb.enable = true;
  # This is needed so home assistant doesn't need password when using sudo to run systemctl (suspend, reboot, etc)
  security.sudo.extraRules= [
  {  
    users = [ "gambled" ];
    commands = [
      { command = "ALL";
        options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
      }
    ];
  }
];
  services.xserver.displayManager.autoLogin.enable = false; # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.user = "gambled";
  

  # Waydroid
  # virtualisation.waydroid.enable = true;
  
  # Steam
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
  };
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses

  # firewall
  #networking.firewall = {
  #  enable = true;
  #  allowedTCPPorts = [ 80 443 22];
  #  allowedUDPPorts = [ 80 443 22];
  #};
  

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Básicamente no cambies esto
  # Leer https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # De verdad, lee eso antes de cambiarlo

  # Servicios extras
  programs.dconf.enable = true; # bugs de wayland y gtk
  networking.interfaces.enp6s0.wakeOnLan.enable = true;
  services.flatpak.enable = true; 
  services.packagekit.enable = true;
  services.fwupd.enable = true;
  hardware.openrazer.enable = true;
  hardware.openrazer.users = ["gambled"];
  systemd.services.zerotierone.enable = true;

  #Wake on lan
  systemd.services.wakeonlan = {
    description = "Reenable wake on lan every boot";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "simple";
      RemainAfterExit = "true";
      ExecStart = "${pkgs.ethtool}/sbin/ethtool -s enp6s0 wol g";
    };
    wantedBy = [ "default.target" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
