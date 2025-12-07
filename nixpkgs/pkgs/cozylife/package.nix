{
  lib,
  fetchFromGitHub,
  buildHomeAssistantComponent,
}:

buildHomeAssistantComponent rec {
  owner = "gambled23";
  domain = "hass_cozylife_local_pull";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "gambled23";
    repo = "hass_cozylife_local_pull";
    tag = "v${version}";
    hash = "sha256-g/I1lUl5lw86/97d6gMNLx4nVrZDCVexfay1JP7TOzA=";
  };

  meta = {
    changelog = "https://github.com/gambled23/hass_cozylife_local_pull/releases/tag/${src.tag}";
    homepage = "https://github.com/gambled23/hass_cozylife_local_pull";
    description = "Volvo Cars Home Assistant integration";
    maintainers = with lib.maintainers; [
      matteopacini
      seberm
    ];
    license = lib.licenses.gpl3Only;
  };
}