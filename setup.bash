#!/bin/bash

# Helper function that outputs to stderr.
echoerr() { printf "%s\n" "$*" >&2; }

echo "Setting up the Pi."

# Update the packages list, unless the user does not wish to do so.
if [ "$1" != "noupdate" ]; then
    echo -n "Updating packages list... "
    sudo apt-get update >/dev/null
    echo "Done!"
else
    echo "Update of packages skipped."
fi

# Install all the packages from the list, unless already present.
packages=(vim)
for package in "${packages[@]}"; do
    if ! dpkg-query -l $package >/dev/null; then
        echo "Installing package $package"
        sudo apt-get -y install $package
    fi
done

# Generate the ssh key first if it doesn't exist.
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo "Generating the SSH key in default location"
    ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa
else
    echoerr "SSH key already exists."
fi

# Copy a base .vimrc file from base_configs folder.
if [ ! -f ~/.vimrc ]; then
    echo "Copying a base vimrc file."
    cp base_configs/vimrc ~/.vimrc
else
    echoerr ".vimrc file already exists"
fi

# Add scripts for increasing and decreasing brightness
cp scripts/increase_brightness.bash ~/Desktop/
cp scripts/decrease_brightness.bash ~/Desktop/

echo "All done!"
