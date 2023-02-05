#
# Debian ISO:
# Debian Netinst ISO with firmware (wifi)
# https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/11.1.0+nonfree/amd64/iso-cd/
# dd if=Downloads/firmware-11.1.0-amd64-netinst.iso of=/dev/sdb bs=4M; sync;
#
# Prepare USB
# sudo gparted
# Device -> Create Partition Table -> gpt
# Partition -> Create New -> fat32
# Manage flags -> msftdata
# sudo 7z x Downloads/test_iso/firmware-11.1.0-amd64-netinst.iso -o/media/orkan/9C23-33A7/
#
# BIOS:
# BIOS -> Safe Boot -> Off
#
# network:
# https://linuxhint.com/3-ways-to-connect-to-wifi-from-the-command-line-on-debian/
# sudo iwconfig 
# sudo iwlist <wlp3s0> scan | grep ESSID
# nmcli d wifi connect <Network_Name> password <password123>
# -> nmtui
# 


# Get USER and HOME path
USER=$(logname)
HOME=/home/$USER

echo " ------------------------- the home is "$HOME

apt -y update
apt -y upgrade
apt -y dist-upgrade

apt install -y \
dkms \
build-essential \ 
linux-headers-$(uname -r) \  
apt-listbugs \
apt-listchanges 

echo " ------------------------- apt updated"

cp config/sources/sources.list /etc/apt/sources.list

apt -y update
apt -y upgrade
apt autoremove
apt -y dist-upgrade

echo " ------------------------- apt updated to sid"

apt-get install --no-install-recommends -y \
exa \
wget \
nano \
htop \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release \
dialog \
tree \
zsh \
network-manager-config-connectivity-debian \
network-manager-openvpn 


echo " ------------------------- system installed"

cp config/bashrc $HOME/.bashrc
cp config/profile $HOME/.profile

mkdir $HOME/.config
cp -Rf config/configs/* $HOME/.config/

mkdir $HOME/.config/autostart
cp config/autostart/* $HOME/.config/autostart

mkdir $HOME/.local
mkdir $HOME/.local/bin
cp config/bin/scripts/* $HOME/.local/bin/
chmod +x $HOME/.local/bin/*


echo " ------------------------- profile files copied"


# i3lock scrot redshift  lxterminal Thunar xfce redshift \


