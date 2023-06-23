#!/bin/sh
pushd ~/dotfiles
home-manager switch --flake ~/dotfiles
popd
