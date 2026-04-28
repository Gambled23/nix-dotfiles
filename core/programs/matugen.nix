{inputs, config, lib, ...}: {
  imports = [
    inputs.matugen.nixosModules.default
  ];

  programs.matugen = {
    enable = true;
    variant = "dark";
    jsonFormat = "hex";
    templates = {
      yazi = {
        input_path = "./templates/yazi.toml";
        output_path = "~/.config/yazi/theme.toml";
      };
    };
  };

  gtk = {
    enable = true;
    gtk4.extraCss = "@import url(\"${config.programs.matugen.theme.files}/.config/gtk-4.0/gtk.css\");";
    gtk3.extraCss = "@import url(\"${config.programs.matugen.theme.files}/.config/gtk-3.0/gtk.css\");";
  };
}