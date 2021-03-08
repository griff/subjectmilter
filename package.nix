{ sources ? (import ./nix/sources.nix) }:
let
  pkgs = import sources.nixpkgs {
      overlays = [
          (self: super: { niv = (import sources.niv {}).niv; })
          #moz_overlay rust_replace
      ];
  };
in
  pkgs.callPackage ./default.nix {}
