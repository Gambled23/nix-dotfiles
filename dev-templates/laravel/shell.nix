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
}