#!/bin/bash

# Helper function that outputs to stderr
echoerr() { printf "%s\n" "$*" >&2; }

echo "Setting up the Pi."

if [ "$1" != "noupdate" ]; then
    echo -n "Updating packages list... "
    sudo apt-get update >/dev/null
    echo "Done!"
else
    echo "Update of packages skipped."
fi

packages=(vim)
for package in "${packages[@]}"; do
    if ! dpkg-query -l $package > /dev/null; then
        echo "Installing package $package"
        sudo apt-get -y install $package
    fi
done

# Generate the ssh key first if it doesn't exist
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    echo "Generating the SSH key in default location"
    ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa
else
    echoerr "SSH key already exists."
fi

if [ ! -f ~/.vimrc ]; then
    echo "Copying a base vimrc file."
    cp base_configs/vimrc ~/.vimrc
else
    echoerr ".vimrc file already exists"
fi
echo "All done!"
