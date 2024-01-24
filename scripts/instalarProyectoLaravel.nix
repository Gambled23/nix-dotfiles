{ pkgs }:

pkgs.writeShellScriptBin "instalarProyectoLaravel" ''
  #!${pkgs.bash}/bin/bash
  # clonar repositorio de github
  read -p "Ingresa el link del repositorio: " repo_link
  git clone $repo_link
  cd  "$(\ls -1dt ./*/ | head -n 1)"

  # instalar dependencias
  composer update
  composer install
  npm install
  npm run build

  cp .env.example .env
  php artisan key:generate
  code

  echo "Proyecto instalado, recuerde restaurar manualmente la BD" | ${pkgs.lolcat}/bin/lolcat
  exit
''


