{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.haskellPackages_ghc783
}:
let
  inherit (haskellPackages)
    cabal
    cabalInstall
    cmdtheline
    filepath
    haskeline
    monadUnify
    mtl
    parsec
    patternArrows
    time
    transformers
    unorderedContainers
    utf8String;
in cabal.mkDerivation (self: {
  pname = "purescript";
  version = "0.5.6.3";
  sha256 = "0f9jzv886dg9aphwaqgx17xk2j6j4v2n12y3yhkbs46icmlr8zxp";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    cmdtheline filepath haskeline monadUnify mtl parsec patternArrows
    time transformers unorderedContainers utf8String
  ];
  testDepends = [ filepath mtl parsec transformers utf8String ];
  meta = {
    homepage = "http://www.purescript.org/";
    description = "PureScript Programming Language Compiler";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
