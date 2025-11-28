with import <nixpkgs> { };

let
  pythonPackages = python3Packages;
in pkgs.mkShell rec {
  name = "php";

  packages = [
    php84
    php84Packages.composer
    nodejs_24
  ];

  postVenvCreation = ''
    composer update
    composer install
    npm install
    npm run build

    cp .env.example .env
    php artisan key:generate
  '';
}