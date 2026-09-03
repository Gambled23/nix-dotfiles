{ self, inputs, lib, ... }: {
  flake.homeModules.noctaliaHome = { pkgs, ... }: {
    imports = [
      inputs.noctalia.homeModules.default
    ] ++ (builtins.filter (lib.hasSuffix ".nix") (lib.filesystem.listFilesRecursive ./_Config));

    programs.noctalia = {
      enable = true;
      systemd.enable = true;
    };

    home.packages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      slurp
      grim
      hyprpicker
      tesseract
      imagemagick
      zbar
      curl
      jq
      bc
      wl-screenrec
      satty
      translate-shell
      ffmpeg_8

      udiskie
      wl-clipboard
      adw-gtk3
      qt6.qtwebsockets 
      (pkgs.callPackage ./_noctalia-update-config.nix { inherit pkgs; })
      python3
    ];
  };
}
