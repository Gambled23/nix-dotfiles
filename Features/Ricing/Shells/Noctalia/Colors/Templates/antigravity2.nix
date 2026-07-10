{...}:{
  home.file.".config/noctalia/templates/antigravity2.json".text = ''
    {
      "userSettings": {
        "customThemeSeedsDark": {
          "background": "#{{colors.surface.dark.hex_stripped}}",
          "foregroundOverride": "#{{colors.on_surface.dark.hex_stripped}}",
          "primary": "#{{colors.primary.dark.hex_stripped}}"
        },
        "customThemeSeedsLight": {
          "background": "#{{colors.surface.light.hex_stripped}}",
          "foregroundOverride": "#{{colors.on_surface.light.hex_stripped}}",
          "primary": "#{{colors.primary.light.hex_stripped}}"
        },
        "themeMode": "THEME_MODE_INHERIT"
      }
    }
  '';
}