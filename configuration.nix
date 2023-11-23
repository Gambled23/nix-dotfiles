# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, outputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "pc-gambled"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  networking.extraHosts =
  ''
    192.168.1.1 router
    10.243.0.2 raspberrypi
    10.243.0.4 pc-gambled
    10.243.0.4 laptop-gambled
    159.54.130.222 nisha

  '';

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  #Enable gnome desktop manager.
  # services.xserver.displayManager.gdm.enable = true;
  #  services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.displayManager.defaultSession = "gnome";

  # Enable KDE Plasma Desktop Environment.
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
  };

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
    vim 
    wget
    home-manager
    android-tools
    # nixos-scripts
    (import ./scripts/auto-pull.nix { inherit pkgs; })
    (import ./scripts/auto-push.nix { inherit pkgs; })
    (import ./scripts/auto-gc.nix { inherit pkgs; })
  ];
  
  # mysql
  services.mysql.package = pkgs.mariadb;
  services.mysql.enable = true;
  # Autoupgrade packages
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gambled = {
    isNormalUser = true;
    description = "César Girón";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  services.xserver.displayManager.autoLogin.enable = false; # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.user = "gambled";
  

  # Waydroid
  virtualisation.waydroid.enable = true;
  
  # Steam
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Básicamente no cambies esto
  # Leer https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # De verdad, lee eso antes de cambiarlo

  # Servicios extras
  programs.dconf.enable = true; # bugs de wayland y gtk
  programs.kdeconnect.enable = true;
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
