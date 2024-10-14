# Update apt
sudo apt-get update
sudo apt-get upgrade

# create jkassis
sudo useradd -m -U jkassis
sudo usermod -aG tty,disk,dialout,sudo,audio,video,plugdev,games,users,input,netdev,bluetooth,docker,systemd-journal

# change shells
chsh /usr/bin/zsh

# install gnome
sudo apt install gnome gnome-shell gnome-tweaks
sudo apt install chrome-gnome-shell gnome-shell-extensions gnome-shell-extension-manager

# choose the gdm display manager
# restart
# purge xfce
sudo apt purge xfce4
sudo apt autoremove


# install fonts
wget -P ~/.local/share/fonts https://github.com/adobe-fonts/source-code-pro/releases/download/variable-fonts/TTF-source-code-pro-VF.ttf
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip ~/.local/share/fonts/FiraCode.zip -d ~/.local/share/fonts/
unzip ~/.local/share/fonts/FiraMono.zip -d ~/.local/share/fonts/
unzip ~/.local/share/fonts/Hack.zip -d ~/.local/share/fonts/
fc-cache -f -v

# configure terminator
# open a new console > right click > preferences
# adjust scrollback and use nerd font mono medium

# install vivaldi
# goto vivaldi webside and download the deb
sudo dpkg -i ~/Downloads/vivaldi*

# change vim and setup clipboard support
# sudo apt install vim-gtk3
sudo install neovim

# keyboard tweaks 
- REMAP ESC AND CAPS LOCK
vi /usr/share/X11/xkb/symbols/pc
setxkbmap
- repeat rates
gsettings set org.gnome.desktop.peripherals.keyboard delay 250 
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30

# mouse tweaks
- SWAP THE LEFT AND RIGHT MOUSE BUTTONS
  Gnome Settings > Mouse & Touchpad > Primary Button
- Natural Scrolling
  Gnome Settings > Mouse & Touchpad > Natural Scrolling

# shortcut tweaks
# Gnome Settings > Keyboard > Shortcuts > View and Customize
# Cmd-Space for search in Launchers Section
# Cmd-w to Close Window in Windows Section
# unbind Cmd-v to open notification in System section
# GNOME Tweaks > Keyboard & Mouse > Overview Shortcut > Right Super

# Cmd-q to Quit Applications
sudo apt install wmctrl
# Gnome Settings > Keyboard > Shortcuts > View and Customize > Custom Shortcut
# add command: `wmctrl -c :ACTIVE:` and map to Cmd-Q

# install plank dock and theme
sudo apt install plank
# Cmd-Space plank to start it 
# ctrl-left click on anything to customize

# enable GNOME extensions
# Cmd-Space Extensions Manager > Toggle to "Use Extensions"

# adjust window titles
# Cmd-Space Tweaks > Window Titlebars > Placement > Left

# enable bluetooth (maybe not necessary)
sudo apt update
sudo install -y bluez bluez-tools
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# install snap (not really used for anything)
sudo apt install snapd
sudo systemctl enable --now snapd

# VS Code
download the .deb file from the website
sudo apt install ./<file>.deb

# install dev tools
sudo apt install cmake build-essentials
sudo apt install sl
sudo install python3 python3-pip
sudo apt install slack
curl https://sh.rustup.rs -sSf | sh
sudo apt install yarn
sudo apt install fzf silversearcher-ag
sudo apt install docker
sudo apt install awscli
sudo apt install dnsutils
sudo snap install core
sudo apt install watch fswatch
sudo apt install arduino

# install kubernetes stuff
sudo apt install kubectl

# install 3d printing stuff
sudo apt install cura

# install an updated golang
apt install -t bookworm-backports golang-go

# install gvm for manging golang
bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
echo '[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"' >> ~/.profile
gvm listall
gvm install go1.23.2
gvm use go1.23.2 --default

# install your ssh key and add to the ssh-agent
# copy your key from somewhere
ssh-add ~/.ssh/id_rsa

