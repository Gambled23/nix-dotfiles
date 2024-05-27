with import <nixpkgs> { };

let
  pythonPackages = python3Packages;
in pkgs.mkShell rec {
  name = "php";

  buildInputs = [
    php83
    php83Packages.composer
    nodejs_21
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