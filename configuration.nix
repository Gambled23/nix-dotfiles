{ config, pkgs, lib, inputs, outputs, ... }:

{
  imports =
    [ 
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
      ./core/services/xserver/sway/sway.nix 
      # ./core/services/xserver/awesome/awesomewm.nix
    ];
  
  # Bootloader.
  #boot.loader.systemd-boot.enable = true; #systemd
  boot.loader = { #grub2
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      default = "saved";
      timeoutStyle = "hidden";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  # set shell
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  # Enable networking
  networking.networkmanager.enable = true;

  networking.extraHosts =
  ''
    192.168.1.1 router

    10.243.0.1 home-gambled
    10.243.0.2 pc-gambled
    10.243.0.3 laptop-gambled
    10.243.0.4 android-gambled
    10.243.0.5 windows-gambled
    10.243.0.6 VR
    10.243.0.69 dev-gambled
    
    159.54.130.222 nisha
  '';

  # bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings.General.Experimental = true; # enables experimental features

  time.timeZone = "America/Mexico_City";   # Set your time zone.
  i18n.defaultLocale = "en_US.UTF-8"; # Select internationalisation properties.
  services.xserver.libinput.enable = true; # Enable touchpad support
  services.printing.enable = true; # Enable CUPS to print documents.

  # nix auto gc delete old generations
  nix = {
    gc = {
      automatic = true; 
      dates = "weekly"; 
      options = "--delete-older-than 7d";
    };
  };
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
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    grub2
    (import ./scripts/auto-pull.nix { inherit pkgs; })
    (import ./scripts/auto-push.nix { inherit pkgs; })
    (import ./scripts/auto-gc.nix { inherit pkgs; })
    (import ./scripts/ssh-github.nix { inherit pkgs; })
    (import ./scripts/instalarProyectoLaravel.nix { inherit pkgs; })
    (import ./scripts/rebootToWindows.nix { inherit pkgs; })
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
  services.xserver.displayManager.autoLogin.enable = false; # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.user = "gambled";

  # All sudo comands will be passwordless (I use this for home assistant)
  security.sudo.extraRules= [{  
    users = [ "gambled" ];
    commands = [{ command = "ALL";
        options= [ "NOPASSWD" ];
        }
      ];
    }
  ];

  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses

  # Básicamente no cambies esto
  # Leer https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # De verdad, lee eso antes de cambiarlo

  # Extra services
  services.flatpak.enable = true; 
  services.packagekit.enable = true;
  services.fwupd.enable = true;
  systemd.services.zerotierone.enable = true;
  programs.adb.enable = true;
  programs.dconf.enable = true; # Wayland-gtk bugs
  
  nixpkgs.config.allowUnfree = true; # Allow unfree packages
}
