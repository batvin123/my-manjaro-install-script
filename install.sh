#!/bin/bash

## update
sudo pacman -Syu --noconfirm

## zsh install and config
cd
sudo pacman -S zsh zsh-syntax-highlighting autojump zsh-autosuggestions --noconfirm
wget https://github.com/ChrisTitusTech/zsh/raw/master/.zshrc -O ~/.zshrc
mkdir -p "$HOME/.zsh"
wget https://github.com/ChrisTitusTech/zsh/raw/master/.zsh/aliasrc -O ~/.zsh/aliasrc
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
touch ~/.cache/zshhistory
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

## awesome
yay -S awesome rofi picom i3lock-fancy xclip ttf-roboto mate-polkit materia-gtk-theme lxappearance flameshot pnmixer network-manager-applet xfce4-power-manager -y
wget -qO- https://git.io/papirus-icon-theme-install | sh
git clone https://github.com/batvin123/material-awesome.git ~/.config/awesome

## apps
sudo pacman -S terminator python htop newsboat cmatrix audacious nemo gedit flatpak --noconfirm
sudo pip install clockr
yay -S barrier --noconfirm
flatpak install us.zoom.Zoom -y
yay -S discord --noconfirm
yay -S lutris --noconfirm
yay -S steam-manjaro --noconfirm
yay -S lightdm-webkit2-greeter lightdm-webkit-theme-aether
yay -S stacer --noconfirm
yay -S veyon --noconfirm
yay -S freetube-bin --noconfirm
yay -S joplin --noconfirm
yay -S virt-manager --noconfirm
yay -S ice-ssb --noconfirm
yay -S gedit --noconfirm
yay -S celluloid --noconfrim
yay -S obs-studio --noconfirm
yay -S kdenlive --noconfrim
yay -S devede --noconfirm
yay -S krita --noconfirm
yay -S corectrl --noconfirm
yay -S grub-customizer --noconfirm
yay -S keepassxc --noconfirm
yay -S scrcpy --noconfirm
yay -S bleachbit --noconfirm
yay -S figlet lolcat --noconfirm 
yay -S qt5-styleplugins --noconfirm
echo 'XDG_CURRENT_DESKTOP=Unity
QT_QPA_PLATFORMTHEME=gtk2
RADV_PERFTEST=aco' | sudo tee -a /etc/environment

## wine and lutris install
yay -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader lutris --noconfirm
yay -S wine lib32-vulkan-icd-loader lib32-vkd3d --noconfirm

## gamemode install
mkdir ~/Downloads/git
yay -S meson systemd git dbus --noconfirm
cd ~/Downloads/git
git clone https://github.com/FeralInteractive/gamemode.git
cd gamemode
git checkout 1.5.1 # omit to build the master branch
./bootstrap.sh

## vkbasalt
cd ~/Downloads/git
git clone https://github.com/DadSchoorse/vkBasalt.git
cd vkBasalt
cd config
echo "add (smaa:smaa:cas) to line 10"
sleep 10s
nano vkBasalt.conf
cd ..
meson --buildtype=release --prefix=/usr builddir
ninja -C builddir install

## vim config 
yay -S vim vim-plug
cd ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget https://raw.githubusercontent.com/ChrisTitusTech/myvim/master/.vimrc

## rofi fix
rm ~/.config/rofi/rofi.rasi

## final update
yay -Syyuu --noconfirm

echo "REBOOT your pc"
