let
  sources = import ./nix/sources.nix;
  /*
  moz_overlay = import sources.nixpkgs-mozilla;
  rust_replace = self: super: {
    rust = let
        rusta = (super.rustChannelOf {
          channel = "1.50.0";
          #channel = "nightly";
        }).rust;
        rust = rusta.override {
          extensions = ["rust-src"];
        };
      in { rustc = rust; cargo = rust; };
    inherit (self.rust) rustc cargo;
  };
  */
  pkgs = import sources.nixpkgs {
      overlays = [
          (self: super: { niv = (import sources.niv {}).niv; })
          #moz_overlay rust_replace
      ];
  };
in
  with pkgs;
  stdenv.mkDerivation {
    name = "subjectmilter";
    buildInputs = [
      niv pkg-config go
    ] ++ (stdenv.lib.optionals stdenv.isDarwin [
      pkgs.darwin.cf-private
      pkgs.darwin.apple_sdk.frameworks.CoreServices
    ]);
  }