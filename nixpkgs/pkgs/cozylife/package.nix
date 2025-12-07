{
  lib,
  fetchFromGitHub,
  buildHomeAssistantComponent,
}:

buildHomeAssistantComponent rec {
  owner = "cozylife";
  domain = "hass_cozylife_local_pull";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "cozylife";
    repo = "hass_cozylife_local_pull";
    tag = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAA=";
  };

  meta = {
    changelog = "https://github.com/cozylife/hass_cozylife_local_pull/releases/tag/${src.tag}";
    homepage = "https://github.com/cozylife/hass_cozylife_local_pull";
    description = "Volvo Cars Home Assistant integration";
    maintainers = with lib.maintainers; [
      matteopacini
      seberm
    ];
    license = lib.licenses.gpl3Only;
  };
}