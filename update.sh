#!/bin/bash

rm -rv ./kitty ; cp -rv ~/.config/kitty .
rm -rv ./cava; cp -rv ~/.config/cava  .
rm -rv ./xmonad; cp -rv ~/.config/xmonad .
rm -rv ./nvim; cp -rv ~/.config/nvim .
rm -rv ./rofi; cp -rv ~/.config/rofi .
rm -rv ./polybar; cp -rv ~/.config/polybar .
rm -v ./.zshrc; cp -v ~/.zshrc .

