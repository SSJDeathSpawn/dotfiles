#!/usr/bin/env nu

let options = $env.HOME | path join ".config/scripts/projects" | ls -s $in | get name | to text

let choice = echo $options | rofi -dmenu

$env.HOME | path join ".config/scripts/projects" | path join $choice | kitty --session $in
