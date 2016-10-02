# leny/vagrant-etab
#
# /provision/00-update-system.sh - Vagrant provision script: system update
#
# coded by leny@flatLand!
# started at 02/09/2016

sudo apt-get update
sudo apt-get upgrade -yq

sudo apt-get install -yq linux-headers-$(uname -r) build-essential dkms tcl
sudo locale-gen fr_BE.UTF-8
