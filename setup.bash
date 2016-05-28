#!/bin/bash

# Helper function that outputs to stderr
echoerr() { printf "%s\n" "$*" >&2; }

echo "Setting up the Pi."

# Generate the ssh key first if it doesn't exist
if [ ! -f ~/.ssh/id_rsa.pub ]; then
	echoerr "Generating the ssh key in default location"
	ssh-keygen -t rsa -b 2048 -N "" -f ~/.ssh/id_rsa
fi

echo "All done!"
