# raspberry-pi-setup
Scripts to setup a new raspberry pi.

## What this thing does

Sets up the following if needed:

* Creates ssh key for your PI
* Installs Vim
* Installs matchbox-keyboard for onscreen keyboard. Useful when using touchscreen with your Pi.
* Copies bare-bones config for Vim from vim.wikia.com

## How to run

    ./setup.bash

If you don't like waiting for the packages to update, add an extra parameter:

    ./setup.bash noupdate

