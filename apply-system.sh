#!/bin/sh
pushd ~/dotfiles
if [ "$(uname -s)" = "Darwin" ]; then
    darwin-rebuild switch --flake .#
else
    sudo nixos-rebuild switch --flake .#
fi
popd
