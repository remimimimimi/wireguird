{ pkgs ? import <nixpkgs> { } }:
with pkgs;
buildGoModule {
  pname = "wireguird";
  version = "1.1.0";

  src = ./.;

  vendorHash = "sha256-h58LXLjlriZJEcKn0K0QiPv+Yfbw0zQQBgMQoFL70UY=";

  # vendorHash = "sha256-/MeaomhmQL3YNrR4a0ihGwZAo5Zk8snpJvCSXY93aM8=";

  CGO_ENABLED = 1;

  proxyVendor = true;

  # hardeningDisable = [ "fortify" ];

  nativeBuildInputs = [
    pkg-config
    go
  ];

  buildInputs = [
    libcap
    gcc
    wireguard-tools
    glib
    gtk3
    libindicator-gtk3
    libappindicator-gtk3
    libayatana-appindicator
    openresolv
  ];
}
