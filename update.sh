#!/bin/bash

rm -rv ./kitty ; cp -rv ~/.config/kitty .
rm -rv ./xmonad; cp -rv ~/.config/xmonad .
rm -rv ./nvim; cp -rv ~/.config/nvim .
rm -rv ./rofi; cp -rv ~/.config/rofi .
rm -rv ./picom; cp -rv ~/.config/picom .

rm -rv ./zshrc.sh; cp -rv ~/.zshrc ./zshrc.sh

rm -rv ./wallpapers; cp -rv ~/pictures/wallpapers .

