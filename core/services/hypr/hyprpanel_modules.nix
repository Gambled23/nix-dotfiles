{ inputs, lib, ... }:
{
  home.file.".config/hyprpanel/modules.json".text = ''
    {
      "custom/vicinae": {
        "icon": "⚡",
        "label": "Vicinae",
        "tooltip": "Abrir vicinae",
        "truncationSize": -1,
        "execute": "",
        "executeOnAction": "",
        "interval": 0,
        "hideOnEmpty": false,
        "scrollThreshold": 1,
        "actions": {
          "onLeftClick": "uwsm app -- vicinae toggle",
          "onRightClick": "",
          "onMiddleClick": "",
          "onScrollUp": "",
          "onScrollDown": ""
        }
      }
    }
  '';

  home.file.".config/hyprpanel/modules.scss".text = ''
    @include styleModule(
      'cmodule-volume', (
        'text-color': #cba6f7,
        'icon-color': #242438,
        'icon-background': #cba6f7,
        'label-background': #242438,
        'inner-spacing': 0.5em,
        'border-enabled': false,
        'border-color': #cba6f7,
        'icon-size': 1.2em
      )
    );
  '';
}