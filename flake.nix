{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs @ {nixpkgs, ...}: let
    systems = ["x86_64-linux"];
    eachSystem = with nixpkgs.lib; f: foldAttrs mergeAttrs { }
      (map (s: mapAttrs (_: v: { ${s} = v; }) (f s)) systems);
  in
    eachSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages = rec {
          hello = pkgs.hello;
          default = hello;
        };

        devShells.default = import ./shell.nix {inherit pkgs;};
      }
    );

}
