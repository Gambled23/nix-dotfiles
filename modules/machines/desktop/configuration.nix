{ self, inputs, ... }: {
  flake.nixosModules.machineDesktop = { pkgs, ... }: {
    imports = [
      # self.nixosModules.ly
      self.nixosModules.noctaliaGreeter
      self.nixosModules.mangowm
      self.nixosModules.desktopScripts
    ];

    environment.systemPackages = with pkgs; [    
      # Clipboard
      cliphist
      wl-clipboard

      # Libs?
      brightnessctl
      # pavucontrol
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
    ];

    programs.appimage = {
      enable = true;
      binfmt = true;
    };
    
    services.libinput.enable = true; # Enable touchpad support

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
      allowedUDPPorts = [ 5353 7236 ];
    };

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

    # Icons for hyprpanel and others
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
      texlivePackages.alfaslabone
    ]; 
  };
}
