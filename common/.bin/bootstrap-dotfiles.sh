#!/bin/bash

set -e  # Exit on any error

cd ~/dotfiles

echo "Linking shared dotfiles from 'common/'..."
stow -t ~ common

# case "$(uname)" in
#   Darwin)
#     echo "Detected macOS — linking 'mac/'..."
#     stow -t ~ mac
#     ;;
#   Linux)
#     echo "Detected Linux — linking 'linux/'..."
#     stow -t ~ linux
#     ;;
#   *)
#     echo "Unknown OS: $(uname). Skipping OS-specific configs."
#     ;;
# esac

echo "Dotfiles bootstrapped successfully."
