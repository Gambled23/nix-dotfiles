{ pkgs }:

pkgs.writeShellScriptBin "dev_instalarProyectoLaravel" ''
  #!${pkgs.bash}/bin/bash
  # clonar repositorio de github
  read -p "Ingresa el link del repositorio: " repo_link
  git clone $repo_link
  cd  "$(\ls -1dt ./*/ | head -n 1)"

  # instalar dependencias
  dev_enviroment laravel

  echo "Proyecto instalado, recuerde restaurar manualmente la BD" | ${pkgs.clolcat}/bin/clolcat
  exit
''


