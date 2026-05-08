{
  lib,
  fetchFromGitHub,
  mkYaziPlugin,
}:
mkYaziPlugin {
  pname = "sshfs.yazi";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "uhs-robert";
    repo = "sshfs.yazi";
    rev = "eca186171c5f2011ce62712f95f699308251c749";
    hash = "sha256-xcz2+zepICZ3ji0Hm0SSUBSaEpabWUrIdG7JmxUl/ts=";
  };

  meta = {
    description = "📡 sshfs.yazi integrates seamlessly with the Yazi terminal file manager, using SSHFS to mount and unmount remote systems so you can browse, preview, and edit single files or entire directories as if they were local.";
    homepage = "https://github.com/uhs-robert/sshfs.yazi";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ khaneliman ];
  };
}