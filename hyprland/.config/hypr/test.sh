#!/bin/bash
# 1. dump the exact environment variables hyprland is using
env > /tmp/hypr_env.log

# 2. force alacritty to run with max verbosity and catch all stderr/stdout
alacritty -vvv > /tmp/alacritty_death.log 2>&1
