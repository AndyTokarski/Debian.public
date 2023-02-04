
# Get USER and HOME path
USER=$(logname)
HOME=/home/$USER

apt -y update
apt -y upgrade

