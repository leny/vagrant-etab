# leny/vagrant-etab
#
# /provision/20-mongodb.sh - Vagrant provision script: MongoDB
#
# coded by leny@flatLand!
# started at 02/09/2016

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

apt-get update
sudo apt-get install -y mongodb-org

echo -en "
[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/mongodb.service

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

systemctl restart mongodb
systemctl enable mongodb
