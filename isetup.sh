#!/bin/bash

set -e

# Function to prompt user for confirmation
confirm() {
    read -p "$1 (y/n): " choice
    case "$choice" in
        y|Y ) return 0;;
        n|N ) return 1;;
        * ) echo "Invalid input. Please enter y or n."; confirm "$1";;
    esac
}

# Helper function to decide if a step should run
should_run() {
    if [[ "$mode" == "a" ]]; then
        return 0
    else
        confirm "$1"
        return $?
    fi
}

# Ask user for mode of operation
echo "Do you want to run everything automatically or confirm each step?"
read -p "Enter 'a' for automatic or 'c' for confirm: " mode

if [[ "$mode" != "a" && "$mode" != "c" ]]; then
    echo "Invalid input. Please restart the script and enter 'a' or 'c'."
    exit 1
fi

# Install Homebrew
if should_run "Install Homebrew?"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install zsh and oh-my-zsh
if should_run "Install zsh and oh-my-zsh?"; then
    brew install zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Just and make
if should_run "Install Just and make?"; then
    brew install just make
fi

# Install Git
if should_run "Install Git?"; then
    brew install git
fi

# Install gh
if should_run "Install GitHub CLI (gh)?"; then
    brew install gh
fi

# Exit message
echo "Setup completed successfully!"
