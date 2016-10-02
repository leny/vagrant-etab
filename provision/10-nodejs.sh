# leny/vagrant-etab
#
# /provision/10-nodejs.sh - Vagrant provision script: node.js
#
# coded by leny@flatLand!
# started at 02/09/2016

# ---------- Install node
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# ---------- Install global npm packages
sudo npm install -g gulp grunt node-inspector forever
