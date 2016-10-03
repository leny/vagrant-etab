# leny/vagrant-etab
#
# /provision/00-update-system.sh - Vagrant provision script: system update
#
# coded by leny@flatLand!
# started at 02/09/2016

sudo apt-get update
sudo apt-get upgrade -yq

sudo apt-get install -yq linux-headers-$(uname -r) build-essential dkms tcl

locale-gen en_US en_US.UTF-8
locale-gen fr_BE fr_BE.UTF-8
dpkg-reconfigure locales

sudo apt-get install -y glances
