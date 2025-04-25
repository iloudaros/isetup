#!/bin/bash

# Function to prompt user for confirmation
confirm() {
    read -p "$1 (y/n): " choice
    case "$choice" in
        y|Y ) return 0;;
        n|N ) return 1;;
        * ) echo "Invalid input. Please enter y or n."; confirm "$1";;
    esac
}

# Ask user for mode of operation
echo "Do you want to run everything automatically or confirm each step?"
read -p "Enter 'a' for automatic or 'c' for confirm: " mode

if [[ "$mode" != "a" && "$mode" != "c" ]]; then
    echo "Invalid input. Please restart the script and enter 'a' or 'c'."
    exit 1
fi

# Install Homebrew
if [[ "$mode" == "a" || ( "$mode" == "c" && confirm "Install Homebrew?" ) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install zsh and oh-my-zsh
if [[ "$mode" == "a" || ( "$mode" == "c" && confirm "Install zsh and oh-my-zsh?" ) ]]; then
    brew install zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Just and make
if [[ "$mode" == "a" || ( "$mode" == "c" && confirm "Install Just and make?" ) ]]; then
    brew install just
    brew install make
fi

# Install Git
if [[ "$mode" == "a" || ( "$mode" == "c" && confirm "Install Rust?" ) ]]; then
    brew install git
fi

# Install gh
if [[ "$mode" == "a" || ( "$mode" == "c" && confirm "Install GitHub CLI (gh)?" ) ]]; then
    brew install gh
fi


# Exit message
echo "Setup completed successfully!"