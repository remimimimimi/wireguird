{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    libcap go gcc
  ];

  shellHook = ''
    # ...
  '';
}
