#!/bin/bash

#######################################################
# INSTALL MY FAVOURITE APPS
#######################################################

##################################
# INSTALL APPS
##################################
sudo dnf update -y
sudo dnf full-upgrade -y

if ! dnf list installed "bash-completion" > /dev/null 2>&1; then
  sudo dnf install -y bash-completion
fi
if ! dnf list installed "git" > /dev/null 2>&1; then
  sudo dnf install -y git
fi
if ! dnf list installed "nano" > /dev/null 2>&1; then
  sudo dnf install -y nano
fi
if ! dnf list installed "fastfetch" > /dev/null 2>&1; then
  sudo dnf install -y fastfetch
fi
if ! dnf list installed "bat" > /dev/null 2>&1; then
  sudo dnf install -y bat
fi

sudo dnf install -y vim htop tmux wget curl zsh neofetch \
	neovim python3 python3-pip python3-devel python3-neovim nodejs \
	npm gcc make cmake clang llvm ctags cscope ripgrep fd-find fzf \
	bat exa tldr ranger highlight xclip xsel xdotool xbacklight xrandr xinput \
	xorg-x11-xinit xorg-x11-server-utils xorg-x11-xauth xorg-x11-xkb-utils xorg-x11-xkb-utils-devel \
	xorg-x11-xkb-utils-x11 xorg-x11-xkb-utils-xkbcomp xorg-x11-xkb-utils-xkbprint xorg-x11-xkb-utils-xkbsel \
	xorg-x11-xkb-utils-xkbutils xorg-x11-xkb-utils-xmodmap xorg-x11-xkb-utils-xpr xorg-x11-xkb-utils-xprop \
	xorg-x11-xkb-utils-xvinfo xorg-x11-xkb-utils-xwd xorg-x11-xkb-utils-xwininfo xorg-x11-xkb-utils-xwud \
	xorg-x11-xkb-utils-xkbcomp xorg-x11-xkb-utils-xkbprint xorg-x11-xkb-utils-xkbsel xorg-x11-xkb-utils-xkbutils \
	xorg-x11-xkb-utils-xmodmap xorg-x11-xkb-utils-xpr xorg-x11-xkb-utils-xprop xorg-x11-xkb-utils-xvinfo xorg-x11-xkb-utils-xwd \
	xorg-x11-xkb-utils-xwininfo xorg-x11-xkb-utils-xwud xorg-x11-xkb-utils-xkbcomp xorg-x11-xkb-utils-xkbprint xorg-x11-xkb-utils-xkbsel \
	flatpak snapd vlc thunderbird grub-customizer obs-studio bleachbit screenkey timeshift \
	gpaste jupyter-notebook 

##################################
# INSTALL VS CODE
##################################
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update
sudo dnf install -y code

##################################
# INSTALL BRAVE BROWSER
##################################
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser

##################################
# INSTALL FLATPAK APPS
##################################
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.bitwarden.desktop
flatpak install flathub com.spotify.Client
flatpak install flathub com.discordapp.Discord

##################################
# INSTALL CHROME
##################################
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo dnf install -y ./google-chrome-stable_current_x86_64.rpm

##################################
# INSTALL MICROSOFT EDGE
##################################
wget https://packages.microsoft.com/yumrepos/edge/microsoft-edge-dev-91.0.864.1-1.x86_64.rpm
sudo dnf install -y ./microsoft-edge-dev-91.0.864.1-1.x86_64.rpm

##################################
# INSTALL ZOOM
##################################
wget https://zoom.us/client/latest/zoom_x86_64.rpm
sudo dnf install -y ./zoom_x86_64.rpm

##################################
# INSTALL GPU DRIVERS
##################################
sudo dnf install -y akmod-nvidia
sudo dnf install -y xorg-x11-drv-nvidia-cuda

##################################
# INSTALL TIMESHIFT BACKUP
##################################
sudo dnf install -y timeshift

##################################
# INSTALL MY FAVOURITE FONTS
##################################
mkdir -p ~/.fonts/
cp -r ./additional_files/fonts/* ~/fonts/
fc-cache -f -v

#######################################################
# INSTALL MY TERMINLA CONFIGURATIONS
#######################################################

##################################
# Clone mybash repo
##################################
mkdir -p ~/Desktop/github/
git clone https://github.com/christitustech/mybash ~/Desktop/github/mybash/
bash ~/Desktop/github/mybash/setup.sh

##################################
# Add MY ALIASES TO ~/.bashrc
##################################
echo -e "# Fedora Customizations\n" >> ~/.bashrc
cat additional_files/add_to_bashrc >> ~/.bashrc 
source ~/.bashrc

#######################################################
#INSTALL FEDORA GRUB THEME
#######################################################

##################################
# INSTALL GOME-GRUB 
##################################
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
sudo mkdir -p /boot/efi/EFI/fedora/themes/
sudo cp -rf ./additional_files/fedora/  /boot/efi/EFI/fedora/themes/
sudo cp -f ./additional_files/add_to_grub /etc/default/
sudo mv -f /etc/default/add_to_grub /etc/default/grub
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

printf "YOU NEED TO REBOOT YOU SYSTEM NOW...\n\n"
read -p "Are you sure you want to reboot? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  systemctl reboot
else
  echo "Reboot cancelled."
fi

bash ./install_grub.sh