#!/bin/bash
set -euo pipefail
IFS=$' \n\t'
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

curl -o font.zip -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
rm -r $HOME/.local/share/fonts || true
mkdir $HOME/.local/share/fonts
mv font.zip $HOME/.local/share/fonts
cd $HOME/.local/share/fonts
unzip font.zip
rm font.zip
fc-cache -f -v
