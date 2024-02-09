{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {};
  };

  home.file.".config/starship.toml".text = ''
  format = """
  $username\
  $hostname\
  $directory\
  $git_branch\
  $git_state\
  $git_status\
  $cmd_duration\
  $line_break\
  $python\
  $character"""

  palette = 'gruvbox_dark'

  [palettes.gruvbox_dark]
  color_fg0 = '#fbf1c7'
  color_bg1 = '#3c3836'
  color_bg3 = '#665c54'
  color_blue = '#458588'
  color_aqua = '#689d6a'
  color_green = '#98971a'
  color_orange = '#d65d0e'
  color_purple = '#b16286'
  color_red = '#cc241d'
  color_yellow = '#d79921'

  [directory]
  style = "color_aqua"

  [character]
  success_symbol = "[❯](color_yellow )"
  error_symbol = "[❯](color_red)"
  vimcmd_symbol = "[❮](color_green)"

  [git_branch]
  format = "[$branch]($style)"
  style = "color_purple"

  [git_status]
  format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)"
  style = "cyan"
  conflicted = "​"
  untracked = "​"
  modified = "​"
  staged = "​"
  renamed = "​"
  deleted = "​"
  stashed = "≡"

  [git_state]
  format = '\([$state( $progress_current/$progress_total)]($style)\) '
  style = "bright-black"

  [cmd_duration]
  format = "[$duration]($style) "
  style = "yellow"

  [python]
  format = "[$virtualenv]($style) "
  style = "bright-black"
  '';
}