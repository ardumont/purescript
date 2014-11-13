# sandbox variable, `n` means no sandbox (by default)
# otherwise, runs in sandbox environment (for ci or for local dev not in env-sandbox)
SANDBOX=n

pr:
	hub pull-request -b purescript:master

env-sandbox:
	nix-shell default.nix

pull:
	git pull --rebase --prune origin master

push:
	git push origin master

install-ci:
	curl https://raw.githubusercontent.com/ardumont/sh/master/nix/install-nix.sh | bash

install-dev:
# see ~/.nixpgs/config.nix - https://github.com/ardumont/dot-files/blob/master/.nixpkgs/config.nix
	nix-env -i env-haskell

update:
	cabal update

to-nix:
	cabal2nix purescript.cabal --sha256 dummy-sha > default.nix

sandbox-init:
	cabal sandbox init && cabal configure --enable-tests

sandbox-delete:
	cabal sandbox delete

tests:
	./run.sh $(SANDBOX) "cabal test "
