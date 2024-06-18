#/bin/bash

sudo cp ./pacman.conf /etc/pacman.conf
sudo pacman-key --init

sudo pacman -S --needed --disable-download-timeout\
    xorg\
    sx\
    xclip\
    picom\
    feh\
    flameshot\
    pulseaudio\
    pulseaudio-alsa\
    libreoffice\
    nvidia-dkms\
    nvidia-utils\
    lib32-nvidia-utils\
    nvidia-settings\
    base-devel\
    btop\
    kitty\
    zsh\
    git\
    git-lfs\
    make\
    cmake\
    gdb\
    glm\
    python\
    python-distlib\
    python-pip\
    npm\
    yarn\
    nodejs\
    vulkan-devel\
    ripgrep\
    fd\
    lz4\
    zstd\
    neovim\
    unrar\
    zip\
    unzip\
    ttf-jetbrains-mono-nerd\
    aria2\
    rubygems\
    mpv\

# Pritunl
sudo pacman-key --keyserver hkp://keyserver.ubuntu.com -r 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo pacman-key --lsign-key 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo pacman -Sy
sudo pacman -S --needed --disable-download-timeout pritunl-client-electron

# mkdirs
mkdir ${HOME}/pictures/
mkdir ${HOME}/dev/ && cd ${HOME}/dev/

# YAY
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -S --needed redpanda-bin openlens-bin google-cloud-cli

# GEM
gem install colorls

# Projects
cd ${HOME}/dev/
aria2c --split=8 'https://sdk.lunarg.com/sdk/download/latest/linux/vulkan-sdk.tar.gz'
aria2c --split=8 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-479.0.0-linux-x86_64.tar.gz'
 
tar -xf './google-cloud-cli-479.0.0-linux-x86_64.tar.gz'
tar -xf ./vulkansdk*.tar.xz
./google-cloud-sdk/install.sh --usage-reporting false --additional-components kubectl -q

git clone --recurse-submodules 'https://git.light7734.com/light7734/light' light
git clone --recurse-submodules 'https://git.light7734.com/light7734/hikari' hikari
git clone --recurse-submodules 'https://git.light7734.com/light7734/bindlessvk' bindlessvk
git clone --recurse-submodules 'https://git.light7734.com/light7734/portfolio' portfolio
git clone --recurse-submodules 'https://git.light7734.com/light7734/dazzle' dazzle
git clone --recurse-submodules 'https://git.light7734.com/light7734/lit' lit
git clone --recurse-submodules 'https://git.light7734.com/light7734/asset-parser' asset-parser
git clone --recurse-submodules 'https://git.light7734.com/light7734/lina' lina

# Config
cd ${HOME}/lina
cp -rt ${HOME}/.config/ kitty picom rofi xmonad nvim
cp ./bash_profile.sh ${HOME}/.bash_profile
cp ./zshrc.sh ${HOME}/.zshrc
cp -r ./wallpapers ${HOME}/pictures/wallpapers

${HOME}/dev/google-cloud-sdk/gcloud init
gcloud container clusters get-credentials bitwyre-production-prd --region asia-northeast1 --project bitwyre-production


echo 'Remember to install the @alebcay/openlens-node-pod-menu extension on open lens'
