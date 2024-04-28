{ config, pkgs, lib, inputs, outputs, ... }:

{
  imports = [ 
    # bootloader
    ./core/bootloader/systemd.nix
    #./core/bootloader/grub.nix
    # mysql
    ./core/services/mysql.nix
    # openssh
    ./core/services/openssh.nix
    # zerotier
    ./core/services/zerotier.nix

    # Select DE
    ./core/services/xserver/kde/default.nix
    #./core/services/xserver/gnome/gnome.nix
    #./core/services/xserver/i3/default.nix
    #./core/services/xserver/awesome/awesomewm.nix
  ];
  
  # set zsh shell
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

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
  '';

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Experimental = true;
  };

  time.timeZone = "America/Mexico_City";
  i18n.defaultLocale = "en_US.UTF-8";
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
  #sound.enable = true;
  #hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  environment.systemPackages = with pkgs; [
    grub2
    (import ./scripts/auto-pull.nix { inherit pkgs; })
    (import ./scripts/auto-push.nix { inherit pkgs; })
    (import ./scripts/auto-gc.nix { inherit pkgs; })
    (import ./scripts/git-clone.nix { inherit pkgs; })
    (import ./scripts/dev/ssh-github.nix { inherit pkgs; })
    (import ./scripts/dev/instalarProyectoLaravel.nix { inherit pkgs; })
    (import ./scripts/dev/migrateDB.nix { inherit pkgs; })
    (import ./scripts/dev/samisecuestro.nix { inherit pkgs; })
    (import ./scripts/dev/mysqlSetupRoot.nix { inherit pkgs; })
    (import ./scripts/dev/sigi.nix { inherit pkgs; })
  ];
  
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  users.users.gambled = {
    isNormalUser = true;
    description = "César Girón";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    packages = with pkgs; [ ];
  };

  # All sudo comands will be passwordless (I use this for home assistant)
  security.sudo.extraRules= [{  
    users = [ "gambled" ];
    commands = [{ 
      command = "ALL";
      options= [ "NOPASSWD" ];
    }];
  }];

  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses

  # Extra services
  services.flatpak.enable = true; 
  services.packagekit.enable = true;
  services.fwupd.enable = true;
  systemd.services.zerotierone.enable = true;
  programs.adb.enable = true;
  programs.dconf.enable = true; # Wayland-gtk bugs

  fonts.packages = with pkgs; [
    times-newer-roman
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  system.userActivationScripts.linktosharedfolder.text = ''
    if [[ ! -h "$HOME/trash" ]]; then
      ln -s "$HOME/trash" "/hdd/$RECYCLE.BIN/"
    fi
  '';
}
