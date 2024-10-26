#!/usr/bin/env bash

files=$(find ~/.config/scripts/projects/ -type f -printf "%f\n")
choice=$(printf "%s\n" "${files}" | rofi -dmenu)
echo $choice
kitty --session "~/.config/scripts/projects/$choice"
