################################################################################################
### APP INSTALLS
### Desktop & System ###
sudo pacman -S\
    xorg\
    xclip\
    lightdm\
    lightdm-openrc\
    picom\
    nitrogen\
    flameshot\
    pulseaudio\
    pulseaudio-alsa\
    pulseaudio-bluetooth\
    bluez\
    bluez-utils\
    xf86-input-wacom\
    qt5-base\
    libreoffice

### Graphics
sudo pacman -S --needed\
    nvidia-dkms\
    nvidia-utils\
    lib32-nvidia-utils\
    nvidia-settings\
    vulkan-icd-loader\
    lib32-vulkan-icd-loader

### YAY to access AUR ###
sudo pacman -S --needed\
    git\
    base-devel

git clone https://aur.archlinux.org/yay.git 
cd yay
makepkg -si

### Monitoring & SystemInformation ###
sudo pacman -S --needed\
    hwinfo\
    lshw\
    htop

### Fonts ###
sudo pacman -S --needed\
    awesome-terminal-fonts

yay -S --needed\
    nerd-fonts-complete 

### Games ###
sudo pacman -S --needed\
    lutris\
    wine\
    steam\
    winetricks\
    obs-studio

yay -S --needed\
    hid-playstation-dkms\
    iriunwebcam-bin

### Media & Downloads ###
sudo pacman -S --needed\
    mpv\
    youtube-dl\
    aria2

yay -S --needed\
    ani-cli 

### Art ###
sudo pacman -S --needed\
    blender\
    gimp\
    krita\
    inkscape\
    tiled\
    lmms\
    tuxguitar

yay -S --needed\
    aseprite\
    pureref

### Development ###
sudo pacman -S --needed\
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
    npm\
    yarn\
    nodejs\
    cargo\
    vulkan-devel\
    ripgrep\
    fd\
    libpng\
    wayland\
    wayland-protocols\
    libpciaccess\
    libx11\
    libxpresent\
    libxcb\
    xcb-util\
    libxrandr\
    xcb-util-keysyms\
    xcb-util-wm\
    lz4\
    zstd\
    neovim
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)

yay -S --needed\
    rider

aria2c 'https://sdk.lunarg.com/sdk/download/latest/linux/vulkan-sdk.tar.gz'

# Socials
sudo pacman -S --needed\
    discord\
    telegram-desktop

yay -S --needed\
    noisetorch


### Compression ###
sudo pacman -S --needed\
    unrar\
    zip

### Misc ###
sudo pacman -S --needed\
    lolcat\
    cowsay\
    fortune-mod\
    cmatrix\
    neofetch\
    tldr\
    whois

yay -S --needed\
    expressvpn-openrc\
    openrgb\
    cava

### Libs ###
sudo pacman -S\
    python-beautifulsoup4

################################################################################################
### CONFIGURATIONS
cd ${HOME}
mkdir dev/
cd dev/
git clone 'https://github.com/light7734/dot-files'
cd 'dot-files/Lina'
cp -rt ${HOME}/.config/ cava kitty lvim picom
cp -r dwm ${HOME}/dev/dwm
cp .zshrc ${HOME}/.zshrc
cd ${HOME}/dev/dwm
sudo make
sudo make install


################################################################################################
### REPOSITORIES
cd ${HOME}/dev
git clone --recurse-submodules 'git@github.com:Light7734/cses' cses

git clone --recurse-submodules 'git@github.com:Light7734/light' light
cd ${HOME}/dev/light
mkdir build
cd Dependencies/shaderc/
./utils/git-sync-deps
cd ../../build
cmake .. -DEXPORT_COMPILE_COMMANDS=1
cmake --build . -j20

git clone --recurse-submodules 'git@github.com:Light7734/raytracer' raytracer
cd ${HOME}/dev/raytracer
mkdir build
cd build
cmake ..
cmake .. -DEXPORT_COMPILE_COMMANDS=1
cmake --build . -j20

git clone --recurse-submodules 'git@github.com:Light7734/vulkan-renderer' vulkan-renderer
cd ${HOME}/dev/vulkan-renderer
mkdir build
cd build
cmake ..
cmake .. -DEXPORT_COMPILE_COMMANDS=1
cmake --build . -j20

git clone --recurse-submodules 'git@github.com:Light7734/homepage' homepage
cd ${HOME}/dev/homepage
rm package-lock.json
sudo npm install -g gatsby-cli
npm install

git clone 'git@github.com:EpicGames/UnrealEngine.git' ue5 --single-branch --branch release
yay -S libicu50
sudo update-ca-trust --fresh
sudo ln -s /etc/ssl /usr/lib/ssl
cd ${HOME}/dev/ue5
./Setup.sh ./GenerateProjectFiles.sh
make
