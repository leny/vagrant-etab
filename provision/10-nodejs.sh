# leny/vagrant-etab
#
# /provision/10-nodejs.sh - Vagrant provision script: node.js
#
# coded by leny@flatLand!
# started at 02/09/2016

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

npm install -g gulp grunt node-inspector supervisor
