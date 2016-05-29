#!/bin/bash

brightness=$(cat /sys/class/backlight/rpi_backlight/brightness)

sudo bash -c "echo $((brightness - 10)) > /sys/class/backlight/rpi_backlight/brightness"

