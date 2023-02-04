
# Get USER and HOME path
USER=$(logname)
HOME=/home/$USER

apt -y update
apt -y upgrade

cp config/sources/sources.list /etc/apt/sources.list

apt -y update
apt -y upgrade

cat /etc/apt/sources.list

