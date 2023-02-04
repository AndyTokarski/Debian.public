
# Get USER and HOME path
USER=$(logname)
HOME=/home/$USER

apt -y update
apt -y upgrade

cp config/sources/sources.list /etc/apt/sources.list

apt -y update
apt -y upgrade
apt autoremove

apt-get install --no-install-recommends \
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
zsh 

