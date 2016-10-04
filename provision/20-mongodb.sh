# leny/vagrant-etab
#
# /provision/20-mongodb.sh - Vagrant provision script: MongoDB
#
# coded by leny@flatLand!
# started at 02/09/2016

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

apt-get update
sudo apt-get install -y mongodb-org

echo -en "# mongod.conf

storage:
  dbPath: /var/lib/mongodb
  journal:
    enabled: true

systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

net:
  port: 27017
" > /etc/mongod.conf

service mongod restart
