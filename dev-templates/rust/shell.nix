with import <nixpkgs> { };

let
  pythonPackages = python3Packages;
in pkgs.mkShell rec {
  name = "rust";

  buildInputs = [
    rustc
    rustup
  ];
}