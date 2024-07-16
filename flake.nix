{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs @ {nixpkgs, ...}: let
    systems = ["x86_64-linux"];
    eachSystem = with nixpkgs.lib; systems: f: foldAttrs mergeAttrs { }
      (map (s: mapAttrs (_: v: { ${s} = v; }) (f s)) systems);
  in
    eachSystem systems (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages = rec {
          wireguird = import ./default.nix {inherit pkgs;};
          default = wireguird;
        };

        devShells.default = import ./shell.nix {inherit pkgs;};
      }
    );

}
