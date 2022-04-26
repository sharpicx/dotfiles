#! /bin/env bash
dir="$HOME/.config/rofi/"

rofi -show run -modi run -sort -theme $dir/nord.rasi -run-command {cmd} 
