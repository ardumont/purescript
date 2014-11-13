{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.haskellPackages_ghc783
}:
let
  inherit (haskellPackages)
    cabal
    cabalInstall
    cmdtheline
    fileEmbed
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
  version = "0.6.0.2";
  sha256 = "1fkbdpfbx7sywcaybw8y5s3x44xlpkrp24gvl0286kajmciix2f8";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    cmdtheline fileEmbed filepath haskeline monadUnify mtl parsec
    patternArrows time transformers unorderedContainers utf8String
  ];
  testDepends = [ filepath mtl parsec transformers utf8String ];
  meta = {
    homepage = "http://www.purescript.org/";
    description = "PureScript Programming Language Compiler";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})