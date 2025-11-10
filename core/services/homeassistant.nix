{ config, pkgs, lib, ... }:

{
  services.home-assistant = {
    enable = true;
    # openFirewall = true;
    config = {
# Loads default set of integrations. Do not remove.
default_config:

# Load frontend themes from the themes folder
frontend:
  themes: !include_dir_merge_named themes

# Log level
logger:
  default: debug
  logs:
    homeassistant.components.shell_command: debug

automation: !include automations.yaml
script: !include scripts.yaml
scene: !include scenes.yaml
switch: !include switch.yaml

# WoL
wake_on_lan:

shell_command:
  suspend_pc: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'sudo systemctl start systemd-suspend'"
  hibernate_pc: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'sudo systemctl hibernate'"
  reboot_pc: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'sudo systemctl reboot'"
  poweroff_pc: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'sudo systemctl poweroff'"
  auto_push: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'aps'"
  auto_pull: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'apll'"
  desktop_1: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 1'"
  desktop_2: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 2'"
  desktop_3: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 3'"
  desktop_4: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 4'"
  desktop_5: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 5'"
  desktop_6: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'qdbus org.kde.KWin /KWin setCurrentDesktop 6'"
  modo_tele: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'modo-tele enable'"
  modo_monitor: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'modo-tele disable'"
  reboot_to_windows: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'reboot-to-windows'"
  gamescope: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17 'start-gamescope-session'"
  display_device_steamdeck: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17  'display-device -d steamdeck'"
  display_device_pc_gambled: "ssh -i /config/keys/id_rsa -o StrictHostKeyChecking=no gambled@192.168.1.17  'display-device -d pc-gambled'"

# Universal media player
media_player:
  - platform: universal
    name: NancyTV
    unique_id: nancy_tv
    device_class: tv
    children:
      - media_player.xview_cuarto
      - media_player.xview_cuarto_2
    browse_media_entity: media_player.xview_cuarto_2
    commands:
      turn_off:
        service: media_player.turn_off
        data:
          entity_id: media_player.xview_cuarto
      turn_on:
        service: media_player.turn_on
        data:
          entity_id: media_player.xview_cuarto
      volume_up:
        service: media_player.volume_up
        data:
          entity_id: media_player.xview_cuarto
      volume_down:
        service: media_player.volume_down
        data:
          entity_id: media_player.xview_cuarto
  - platform: universal
    name: SalaTV
    unique_id: sala_tv
    device_class: tv
    children:
      - media_player.xview_sala
      - media_player.xview_sala_2
    browse_media_entity: media_player.xview_sala_2
    commands:
      turn_off:
        service: media_player.turn_off
        data:
          entity_id: media_player.xview_sala
      turn_on:
        service: media_player.turn_on
        data:
          entity_id: media_player.xview_sala
      volume_up:
        service: media_player.volume_up
        data:
          entity_id: media_player.xview_sala
      volume_down:
        service: media_player.volume_down
        data:
          entity_id: media_player.xview_sala

#Custom panels
panel_custom:
  - name: Supervisor
    url_path: hassio/system
    sidebar_title: Supervisor
    sidebar_icon: mdi:home-assistant
    module_url: /local/panel-redirect.js

packages: docker-compose
  docker

    }
    configWritable = true;
  };
}
